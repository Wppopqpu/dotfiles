# the CLASSPATH can be set with
# `java-config --set-system-classpath`
fp=$HOME/.gentoo/java-env-classpath
if [[ -f $fp ]]; then
	source $fp
fi
