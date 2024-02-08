#!/bin/sh

# Starts the server, now with no need of STS!

# run package manager

mvn clean package

# copy the final war file to webapp

SERVER_DIRECTORY="/Users/iqmalaizat/Documents/college files/INTERNET-PROGRAMMING/apache-tomcat-9.0.85"
export CATALINA_HOME="$SERVER_DIRECTORY"
cp ./target/MBIP-Low-Carbon.war "$SERVER_DIRECTORY/webapps"

# run the server

"$SERVER_DIRECTORY/bin/startup.sh"