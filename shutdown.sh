#!/bin/bash
kill -9 ${lsof -i tcp:3000 | awk '{ print $2 }' | uniq | sed '2q;d' }
kill -9 ${lsof -i tcp:8080 | awk '{ print $2 }' | uniq | sed '2q;d' }
cd ~/Documents/dbs && sudo docker-compose down
