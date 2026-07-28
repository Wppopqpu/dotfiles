#!/bin/fish
# Find evremap virtual input device and update bongocat config.

argparse 's/sleep=' 'r/retries=' 'i/interval=' 'h/help' -- $argv

if set -q _flag_help
	echo "Usage: update_bongocat_devices.fish [-s SEC] [-r NUM] [-i SEC] [-h]"
	echo "  -s, --sleep SEC     Sleep SEC seconds before running"
	echo "  -r, --retries NUM   Max retry count (default: 10)"
	echo "  -i, --interval SEC  Retry interval in seconds (default: 0.1)"
	echo "  -h, --help          Show this help message"
	exit 0
end

set -l sleep_secs 0
if set -q _flag_sleep
	set sleep_secs $_flag_sleep
end

set -l max_retries 10
if set -q _flag_retries
	set max_retries $_flag_retries
end

set -l interval 0.1
if set -q _flag_interval
	set interval $_flag_interval
end

sleep $sleep_secs

set config_dir /home/branch/.local/state/noctalia
set config_file $config_dir/settings.toml

set -l event_dev ""
for i in (seq 1 $max_retries)
	set event_dev (
		cat /proc/bus/input/devices |
		grep -A 10 "evremap Virtual input" |
		grep "H: Handlers" |
		grep -oE 'event[0-9]+' |
		head -1
	)

	if test -n "$event_dev"
		break
	end

	echo "Attempt $i/$max_retries: Device not found, retrying in $interval s..."
	sleep $interval
end

if test -z "$event_dev"
	echo "Error: Could not find evremap virtual input device after $max_retries attempts" >&2
	exit 1
end

echo "Found device: /dev/input/$event_dev"

mkdir -p $config_dir

if test -f $config_file
    sed -i "s|^input_devices = .*|input_devices = [ \"/dev/input/$event_dev\" ]|" $config_file
else
	echo "Failed to find config file. Creating one."
	touch $config_file
end

echo "Config written to $config_file"
