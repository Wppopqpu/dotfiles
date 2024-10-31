#!/bin/fish
# This file add a .stowed dir for every stow package containing a flag.

set package_list (ls)

for package in $package_list
	if test $package = .git
		echo "./.git/ directory skipped."
	else if test -d $package
		mkdir $package/.stowed
		touch $package/.stowed/$package
		echo "./$package/.stowed/$package created."
	else
		echo "./$package is not a directory. Skipped."
	end
end
