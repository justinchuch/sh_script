#!/bin/sh
# for macos use
echo Please run using: source ch2j18.sh
/usr/libexec/java_home -V
export JAVA_HOME=`/usr/libexec/java_home -v 1.8*`
echo "JAVA_HOME: " $JAVA_HOME
java -version
