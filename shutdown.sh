#!/bin/sh
port3000=$(lsof -i tcp:3000 | awk '{ print $2 }' | uniq | sed '2q;d') 
kill -9 $port3000
port8080=${lsof -i tcp:8080 | awk '{ print $2 }' | uniq | sed '2q;d' }
kill -9 port8080
cd ~/Documents/dbs && sudo docker-compose down
