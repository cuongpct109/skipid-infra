#!/bin/sh

# Kill processes which using 3000 port
port_3000=$(lsof -i:3000 | awk '{print $2}' | uniq | tail -n+2)
if [ -z $port_3000 ]             
then
    echo "nothing is running on port 3000"
    echo "==============================="
else
    for i in $(echo $port_3000 | sed "s/,/ /g")  
    do
        kill -9 $i > /dev/null
        echo "killing process (ID=$i) with port 3000"
        echo "==============================="
    done
fi


# Kill processes which using 8080 port
port_8080=$(lsof -i:8080 | awk '{print $2}' | uniq | tail -n+2)
if [ -z $port_8080 ]             
then
    echo "nothing is running on port 3000"
    echo "==============================="
else
    for i in $(echo $port_8080 | sed "s/,/ /g")  
    do
        kill -9 $i > /dev/null
        echo "killing process (ID=$i) with port 8080"
        echo "==============================="
    done
fi

if [ -d ~/Documents/skipid ]    
then
    rm -rf ~/Documents/skipid
    echo "~/Documents/skipid removed"
else
    :
fi

if [ -d ~/apache-tomcat-8.0.53 ]    
then
    rm -rf ~/apache-tomcat-8.0.53
    echo "~/apache-tomcat-8.0.53 removed"
else
    :
fi

if [ -d ~/apache-ant-1.9.16 ]    
then
    rm -rf ~/apache-ant-1.9.16
    echo "~/apache-ant-1.9.16 removed"
else
    :
fi

if [ -f ~/apache-tomcat-8.0.53.zip ]
then
    rm -rf ~/apache-tomcat-8.0.53.zip
    echo "~/apache-tomcat-8.0.53.zip removed"
else 
    :
fi

if [ -f ~/apache-ant-1.9.16-bin.zip ]
then
    rm -rf ~/apache-ant-1.9.16-bin.zip
    echo "~/apache-ant-1.9.16-bin.zip removed"
else 
    :
fi

# Update
sudo apt update;

# Download apache-tomcat-8.0.53 and apache-ant-1.9.16
cd ~ && wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.0.53/bin/apache-tomcat-8.0.53.zip && unzip -o apache-tomcat-8.0.53.zip && rm apache-tomcat-8.0.53.zip && chmod +x ~/apache-tomcat-8.0.53/bin/catalina.sh ~/apache-tomcat-8.0.53/bin/startup.sh ~/apache-tomcat-8.0.53/bin/shutdown.sh
cd ~ && wget https://dlcdn.apache.org//ant/binaries/apache-ant-1.9.16-bin.zip && unzip -o apache-ant-1.9.16-bin.zip && rm apache-ant-1.9.16-bin.zip && chmod +x ~/apache-ant-1.9.16/bin/ant ~/apache-ant-1.9.16/bin/antRun

# Check current shell and configure JAVA if needed

if [ "$(echo $0)" = "/bin/bash" ]; then
    if [ -d ~/java1.8-272 ] 
    then
        rm -rf ~/java1.8-272
        cd ~ && wget https://builds.openlogic.com/downloadJDK/openlogic-openjdk/8u272-b10/openlogic-openjdk-8u272-b10-linux-x64.tar.gz 
        tar -xvf openlogic-openjdk-8u272-b10-linux-x64.tar.gz
        rm openlogic-openjdk-8u272-b10-linux-x64.tar.gz 
        mv openlogic-openjdk-8u272-b10-linux-x64 java1.8-272 
        echo "export JAVA_HOME=~/java1.8-272\nexport PATH=\$PATH:\$JAVA_HOME/bin\n" >> ~/.bashrc 
        source ~/.bashrc
    else
        cd ~ && wget https://builds.openlogic.com/downloadJDK/openlogic-openjdk/8u272-b10/openlogic-openjdk-8u272-b10-linux-x64.tar.gz 
        tar -xvf openlogic-openjdk-8u272-b10-linux-x64.tar.gz 
        rm openlogic-openjdk-8u272-b10-linux-x64.tar.gz 
        mv openlogic-openjdk-8u272-b10-linux-x64 java1.8-272
        echo "export JAVA_HOME=~/java1.8-272\nexport PATH=\$PATH:\$JAVA_HOME/bin\n" >> ~/.bashrc
        source ~/.bashrc
    fi
fi

if [ "$(echo $0)" = "/bin/sh" ]; then
    if [ -d ~/java1.8-272 ] 
    then
        rm -rf ~/java1.8-272
        cd ~ && wget https://builds.openlogic.com/downloadJDK/openlogic-openjdk/8u272-b10/openlogic-openjdk-8u272-b10-linux-x64.tar.gz 
        tar -xvf openlogic-openjdk-8u272-b10-linux-x64.tar.gz
        rm openlogic-openjdk-8u272-b10-linux-x64.tar.gz 
        mv openlogic-openjdk-8u272-b10-linux-x64 java1.8-272 
        echo "export JAVA_HOME=~/java1.8-272\nexport PATH=\$PATH:\$JAVA_HOME/bin\n" >> ~/.bashrc 
        source ~/.bashrc
    else
        cd ~ && wget https://builds.openlogic.com/downloadJDK/openlogic-openjdk/8u272-b10/openlogic-openjdk-8u272-b10-linux-x64.tar.gz 
        tar -xvf openlogic-openjdk-8u272-b10-linux-x64.tar.gz 
        rm openlogic-openjdk-8u272-b10-linux-x64.tar.gz 
        mv openlogic-openjdk-8u272-b10-linux-x64 java1.8-272
        echo "export JAVA_HOME=~/java1.8-272\nexport PATH=\$PATH:\$JAVA_HOME/bin\n" >> ~/.bashrc
        source ~/.bashrc
    fi
fi

if [ "$(echo $0)" = "/bin/zsh" ]; then
    if [ -d ~/java1.8-272 ] 
    then
        rm -rf ~/java1.8-272
        cd ~ && wget https://builds.openlogic.com/downloadJDK/openlogic-openjdk/8u272-b10/openlogic-openjdk-8u272-b10-linux-x64.tar.gz 
        tar -xvf openlogic-openjdk-8u272-b10-linux-x64.tar.gz
        rm openlogic-openjdk-8u272-b10-linux-x64.tar.gz 
        mv openlogic-openjdk-8u272-b10-linux-x64 java1.8-272 
        echo "export JAVA_HOME=~/java1.8-272\nexport PATH=\$PATH:\$JAVA_HOME/bin\n" >> ~/.bashrc 
        source ~/.zshrc
    else
        cd ~ && wget https://builds.openlogic.com/downloadJDK/openlogic-openjdk/8u272-b10/openlogic-openjdk-8u272-b10-linux-x64.tar.gz 
        tar -xvf openlogic-openjdk-8u272-b10-linux-x64.tar.gz 
        rm openlogic-openjdk-8u272-b10-linux-x64.tar.gz 
        mv openlogic-openjdk-8u272-b10-linux-x64 java1.8-272
        echo "export JAVA_HOME=~/java1.8-272\nexport PATH=\$PATH:\$JAVA_HOME/bin\n" >> ~/.bashrc
        source ~/.zshrc
    fi
fi


# Clone common and kyc-api source
mkdir ~/Documents/skipid 
cd ~/Documents/skipid && git clone https://gitlab.com/ultorex/skipid/backend/common.git && git clone https://gitlab.com/ultorex/skipid/backend/kyc-api.git 


# Build kyc-api with gradlew then move file war into webapps folder of tomcat-8.0.53
cd ~/Documents/skipid/kyc-api && ./gradlew build && cd ~/Documents/skipid/kyc-api/build/libs && mv kyc-api-0.0.1-SNAPSHOT.war ~/apache-tomcat-8.0.53/webapps/ && mv ~/apache-tomcat-8.0.53/webapps/kyc-api-0.0.1-SNAPSHOT.war ~/apache-tomcat-8.0.53/webapps/kyc-api.war

# Clone kyc-admin source
cd ~/Documents/skipid && git clone https://gitlab.com/ultorex/skipid/backend/kyc-admin.git 


# Build kyc-admin with ant then move war file to webapps folder of tomcat-8.0.53
cd ~/Documents/skipid/kyc-admin && ~/apache-ant-1.9.16/bin/ant && cd ~/Documents/skipid/kyc-admin/dist && mv hibtc-back.war ~/apache-tomcat-8.0.53/webapps/

# Clone skipid frontend and copy .env (previously add to ~/Documents/utilities folder) to skipid frontend base folder 
cd ~/Documents/skipid && git clone https://gitlab.com/ultorex/skipid/frontend/skipid.git && cd ~/Documents/skipid/skipid && touch .env && cp /home/cuong/Documents/utilities/.env ~/Documents/skipid/skipid/

# Install skipid frontend with yarn
yarn install

# Start tomcat server at port 8080
~/apache-tomcat-8.0.53/bin/startup.sh

# Start skipid frontend server at port 3000
cd ~/Documents/skipid/skipid 
yarn build
yarn global add serve
serve -s build -p 3000 &

# Remove .env file in the utilities folder
rm -rf ~/Documents/utilities/.env
