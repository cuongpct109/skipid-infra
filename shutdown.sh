#!/bin/sh

# Kill processes which using 3000 port

for i in $(lsof -i:3000 | awk '{print $2}' | uniq | tail -n+2)
do
kill -9 $i 
done

# Kill processes which using 8080 port
for i in $(lsof -i:8080 | awk '{print $2}' | uniq | tail -n+2)
do
kill -9 $i 
done

# kill mysql containers 
mysql=$(sudo docker ps | grep "mysql" | awk '{ print $1 }' | uniq)

if [ -z "$mysql" ]
then
    echo "mysql container is not running"
else
    for i in $mysql
    do
        sudo docker stop $i > /dev/null && echo "mysql container with ID = $i has stopped"
    done
fi

# kill mongodb containers
mongo=$(sudo docker ps | grep "mongo" | awk '{ print $1 }' | uniq)

if [ -z "$mongo" ]
then
    echo "mongo container is not running"
else
    for i in $mongo
    do
        sudo docker stop $i > /dev/null && echo "mongo container with ID = $i has stopped"
    done
fi

# kill redis containers
redis=$(sudo docker ps | grep "redis" | awk '{ print $1 }' | uniq)

if [ -z "$redis" ]
then
    echo "redis container is not running"
else
    for i in $redis
    do
        sudo docker stop $i > /dev/null && echo "redis container with ID = $i has stopped"
    done
fi
