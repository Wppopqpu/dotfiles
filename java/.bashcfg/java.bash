# the CLASSPATH can be set with
# `java-config --set-system-classpath`
local fp=$HOME/.gentoo/java-env-classpath
if [[ -f $fp ]]; then
	source $fp
fi
