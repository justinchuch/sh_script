#!/bin/sh
# for macos use
echo Please run using: source ch2j16.sh
/usr/libexec/java_home -V
export JAVA_HOME=`/usr/libexec/java_home -v 1.6.0_65-b14-468`
echo "JAVA_HOME: " $JAVA_HOME
java -version
