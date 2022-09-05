#!/bin/sh

# Kill processes which using 3000 port
port_3000=$(lsof -i:3000 | awk '{print $2}' | uniq | tail -n+2)
if [ -z $port_3000 ]
then 
    echo "nothing is running on port 3000"
    echo "==============================="
else
    for i in $port_3000
    do
        kill -9 $i > /dev/null 2>&1
        echo "killing process (ID=$i) with port 3000"
        echo "==============================="
    done
fi

# Kill processes which using 8080 port
port_8080=$(lsof -i:8080 | awk '{print $2}' | uniq | tail -n+2)
if [ -z $port_8080 ]
then 
    echo "nothing is running on port 8080"
    echo "==============================="
else
    for i in $port_8080
    do
        kill -9 $i > /dev/null 2>&1
        echo "killing process (ID=$i) with port 8080"
        echo "==============================="
    done
fi

# Check and remove relevant containers if needed
# getContainerID <CONTAINER-NAME> <PORT>. Ex: getContainerID redis 6379
# removeContainer <CONTAINER-ID>. Ex: removeContainer $(getContainerID redis 6379)

getContainerID () {
      if [ -z $( docker container ls --format "table {{.ID}}\t{{.Names}}\t{{.Ports}}" -a| tail -n+2 | grep $1 | 
                if [ -z "$2" ]
                then awk '{ print $1 }'
                else grep -w "$2" | awk '{ print $1 }'
                fi
                ) ]
      then 
            docker container ls --format "table {{.ID}}\t{{.Names}}\t{{.Ports}}" -a| tail -n+2 | grep $1 | 
                if [ -z "$2" ]
                then awk '{ print $1 }'
                else grep -w "$2" | awk '{ print $1 }'
                fi
      else 
            docker container ls --format "table {{.ID}}\t{{.Names}}\t{{.Ports}}" -a| tail -n+2 | grep $1 |  awk '{ print $1 }'
    fi
}


removeContainer () {                                                             
      export containerID=$1
      if [ -z "$containerID" ]
      then
            :
      else
            sudo docker stop "$containerID"
            sudo docker rm "$containerID"
      fi
}

removeContainer $(getContainerID redis 6379)                                     
removeContainer $(getContainerID mysql 3306)
removeContainer $(getContainerID mongo 27017)



# Check and remove relevant images if needed
# getImageID <REPOSITORY-NAME> <TAG>. Ex: getImageID redis latest
# removeImage <IMAGE-ID>. Ex: removeImage $(getImageID redis latest)

getImageID () {
      docker image list --format "table {{.ID}}\t{{.Repository}}\t{{.Tag}}"| tail -n+2 | grep $1 | 
                if [ -z "$2" ]
                then awk '{ print $1 }'
                else grep -w "$2" | awk '{ print $1 }'
                fi
}

removeImage () {                                                             
      export imageID=$1
      if [ -z "$imageID" ]
      then
            :
      else
            sudo docker rmi "$imageID"
      fi
}

removeImage $(getImageID redis latest)                                     
removeImage $(getImageID mysql 5.7)
removeImage $(getImageID mongo 4.4)

