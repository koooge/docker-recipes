#!/bin/sh

java -jar gitbucket.war --port=51453 --gitbucket.home=data > logs/gitbucket.log 2>&1 &
