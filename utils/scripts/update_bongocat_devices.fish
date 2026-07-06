#!/bin/fish
# Find evremap virtual input device and update bongocat config.

set config_dir /home/branch/.local/state/noctalia
set config_file $config_dir/settings.toml

# Find the evremap virtual input device and extract event number
set event_dev (
    cat /proc/bus/input/devices |
    grep -A 10 "evremap Virtual input" |
    grep "H: Handlers" |
    grep -oE 'event[0-9]+' |
    head -1
)

if test -z "$event_dev"
    echo "Error: Could not find evremap virtual input device" >&2
    exit 1
end

echo "Found device: /dev/input/$event_dev"

mkdir -p $config_dir

if test -f $config_file
    sed -i "s|^input_devices = .*|input_devices = [ \"/dev/input/$event_dev\" ]|" $config_file
else
	echo "Failed to find config file. Creating one."
	touch $config_file
	# echo "[widget.cat]" > $config_file
	#  echo "input_devices = [ \"/dev/input/$event_dev\" ]" >> $config_file
	# echo "scale = 1.7" >> $config_file
	# echo "type = \"noctalia/bongocat:cat\"" >> $config_file
end

echo "Config written to $config_file"
