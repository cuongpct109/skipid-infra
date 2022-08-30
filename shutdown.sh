#!/bin/sh

# Kill processes which using 3000 port
port_3000=$(lsof -i:3000 | awk '{print $2}' | uniq | tail -n+2)
if [ -z $port_3000 ]
then 
    echo "nothing is running on port 3000"
else
    for i in $port_3000
    do
        kill -9 $i > /dev/null && echo "killing process (ID=$i) with port 3000"
    done
fi

# Kill processes which using 8080 port
port_8080=$(lsof -i:8080 | awk '{print $2}' | uniq | tail -n+2)
if [ -z $port_8080 ]
then 
    echo "nothing is running on port 8080"
else
    for i in $port_8080
    do
        kill -9 $i > /dev/null && echo "killing process (ID=$i) with port 8080"
    done
fi

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
