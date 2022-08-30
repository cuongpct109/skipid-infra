#!/bin/zsh
port_3000=${ lsof -i tcp:3000 | awk '{ print $2 }' | uniq | sed '2q;d' } 
kill -9 $port_3000
port_8080=${ lsof -i tcp:8080 | awk '{ print $2 }' | uniq | sed '2q;d' }
kill -9 $port_8080
cd ~/Documents/dbs && sudo docker-compose down
