#!/bin/sh
# Change Java Home for the current Terminal session
echo Please run using: source ch2j17.sh
/usr/libexec/java_home -V
export JAVA_HOME=`/usr/libexec/java_home -v 1.7*`
echo "JAVA_HOME: " $JAVA_HOME
export PATH=${JAVA_HOME}/bin:${PATH}
java -version
