#!/bin/sh

mvn clean package
SERVER_DIRECTORY="/Users/iqmalaizat/Documents/college files/INTERNET-PROGRAMMING/apache-tomcat-9.0.85"
cp ./target/MBIP-Low-Carbon.war "$SERVER_DIRECTORY/webapps"
