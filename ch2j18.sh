#!/bin/sh
# Change Java Home for the current Terminal session
echo Please run using: source ch2j18.sh
/usr/libexec/java_home -V
export JAVA_HOME=`/usr/libexec/java_home -v 1.8*`
echo "JAVA_HOME: " $JAVA_HOME
export PATH=${JAVA_HOME}/bin:${PATH}
java -version
