set -l options (fish_opt --short h --long help) (fish_opt --short s --long src --required-val)
argparse $options -- $argv

if set -q _flag_help
	echo -e "stow_damn_nvidia_driver_file.fish:"
	echo -e
	echo -e "(for 580xx users)"
	echo -e "This file will hard link the nvidia driver file in the right place for yay to use."
	echo -e "For some reason, the driver file has to be downloaded manually using a browser."

	return 0
end

set path_list "/home/branch/.cache/yay/lib32-nvidia-580xx-utils" \
	"/home/branch/.cache/yay/nvidia-580xx-settings" \
	"/home/branch/.cache/yay/nvidia-580xx-utils" \

set filename (path basename $_flag_src)

for each in $path_list
	mkdir -p $each
	ln $_flag_src $each/$filename
	echo hard linked $_flag_src to $each/$filename
end

return 0

