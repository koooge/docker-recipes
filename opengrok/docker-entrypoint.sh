#!/bin/bash

DURATON=43200
SVN_PATH=http://path/to/svn/repo

OPENGROK_TOMCAT_BASE=/usr/local/tomcat /opengrok/bin/OpenGrok deploy
/usr/local/tomcat/bin/catalina.sh start

svn co $SVN_PATH /var/opengrok/src --non-interactive
/opengrok/bin/OpenGrok index

while true
do
    sleep $DURATION
    svn update /src --non-interactive
    /opengrok/bin/OpenGrok index
done
