#!/bin/sh

# shuts down the server

SERVER_DIRECTORY="/Users/iqmalaizat/Documents/college files/INTERNET-PROGRAMMING/apache-tomcat-9.0.85"
export CATALINA_HOME="$SERVER_DIRECTORY"


"$SERVER_DIRECTORY/bin/shutdown.sh"