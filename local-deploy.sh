#!/bin/zsh

# Create .env file in ~/Documents/utilities/ folder

eval "$(curl https://raw.githubusercontent.com/cuongpct109/skipid-infra/main/env-config.sh)"

# Killing port 3000, port 8080 and delete necessary folders

eval "$(curl https://raw.githubusercontent.com/cuongpct109/skipid-infra/main/prepare-port-folder.sh)"

# Update

sudo apt update;

# Download apache-tomcat-8.0.53 and apache-ant-1.9.16

cd ~ && wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.0.53/bin/apache-tomcat-8.0.53.zip && unzip -o apache-tomcat-8.0.53.zip && rm apache-tomcat-8.0.53.zip && chmod +x ~/apache-tomcat-8.0.53/bin/catalina.sh ~/apache-tomcat-8.0.53/bin/startup.sh ~/apache-tomcat-8.0.53/bin/shutdown.sh
cd ~ && wget https://dlcdn.apache.org//ant/binaries/apache-ant-1.9.16-bin.zip && unzip -o apache-ant-1.9.16-bin.zip && rm apache-ant-1.9.16-bin.zip && chmod +x ~/apache-ant-1.9.16/bin/ant ~/apache-ant-1.9.16/bin/antRun

# Check current shell and configure JAVA if needed

if [ "$(echo $0)" = "bash" ]; then
    if [ -d ~/java1.8-272 ] 
    then
        rm -rf ~/java1.8-272
        cd ~ && wget https://builds.openlogic.com/downloadJDK/openlogic-openjdk/8u272-b10/openlogic-openjdk-8u272-b10-linux-x64.tar.gz 
        tar -xvf openlogic-openjdk-8u272-b10-linux-x64.tar.gz
        rm -rf openlogic-openjdk-8u272-b10-linux-x64.tar.gz*
        mv openlogic-openjdk-8u272-b10-linux-x64 java1.8-272 
        echo "export JAVA_HOME=~/java1.8-272\nexport PATH=\$PATH:\$JAVA_HOME/bin\n" >> ~/.bashrc 
        source ~/.bashrc
    else
        cd ~ && wget https://builds.openlogic.com/downloadJDK/openlogic-openjdk/8u272-b10/openlogic-openjdk-8u272-b10-linux-x64.tar.gz 
        tar -xvf openlogic-openjdk-8u272-b10-linux-x64.tar.gz 
        rm -rf openlogic-openjdk-8u272-b10-linux-x64.tar.gz*
        mv openlogic-openjdk-8u272-b10-linux-x64 java1.8-272
        echo "export JAVA_HOME=~/java1.8-272\nexport PATH=\$PATH:\$JAVA_HOME/bin\n" >> ~/.bashrc
        source ~/.bashrc
    fi
fi

if [ "$(echo $0)" = "sh" ]; then
    if [ -d ~/java1.8-272 ] 
    then
        rm -rf ~/java1.8-272
        cd ~ && wget https://builds.openlogic.com/downloadJDK/openlogic-openjdk/8u272-b10/openlogic-openjdk-8u272-b10-linux-x64.tar.gz 
        tar -xvf openlogic-openjdk-8u272-b10-linux-x64.tar.gz
        rm -rf openlogic-openjdk-8u272-b10-linux-x64.tar.gz*
        mv openlogic-openjdk-8u272-b10-linux-x64 java1.8-272 
        echo "export JAVA_HOME=~/java1.8-272\nexport PATH=\$PATH:\$JAVA_HOME/bin\n" >> ~/.bashrc 
        source ~/.bashrc
    else
        cd ~ && wget https://builds.openlogic.com/downloadJDK/openlogic-openjdk/8u272-b10/openlogic-openjdk-8u272-b10-linux-x64.tar.gz 
        tar -xvf openlogic-openjdk-8u272-b10-linux-x64.tar.gz 
        rm -rf openlogic-openjdk-8u272-b10-linux-x64.tar.gz*
        mv openlogic-openjdk-8u272-b10-linux-x64 java1.8-272
        echo "export JAVA_HOME=~/java1.8-272\nexport PATH=\$PATH:\$JAVA_HOME/bin\n" >> ~/.bashrc
        source ~/.bashrc
    fi
fi

if [ "$(echo $0)" = "zsh" ]; then
    if [ -d ~/java1.8-272 ] 
    then
        rm -rf ~/java1.8-272
        cd ~ && wget https://builds.openlogic.com/downloadJDK/openlogic-openjdk/8u272-b10/openlogic-openjdk-8u272-b10-linux-x64.tar.gz 
        tar -xvf openlogic-openjdk-8u272-b10-linux-x64.tar.gz
        rm -rf openlogic-openjdk-8u272-b10-linux-x64.tar.gz*
        mv openlogic-openjdk-8u272-b10-linux-x64 java1.8-272 
        echo "export JAVA_HOME=~/java1.8-272\nexport PATH=\$PATH:\$JAVA_HOME/bin\n" >> ~/.zshrc 
        source ~/.zshrc
    else
        cd ~ && wget https://builds.openlogic.com/downloadJDK/openlogic-openjdk/8u272-b10/openlogic-openjdk-8u272-b10-linux-x64.tar.gz 
        tar -xvf openlogic-openjdk-8u272-b10-linux-x64.tar.gz 
        rm -rf openlogic-openjdk-8u272-b10-linux-x64.tar.gz*
        mv openlogic-openjdk-8u272-b10-linux-x64 java1.8-272
        echo "export JAVA_HOME=~/java1.8-272\nexport PATH=\$PATH:\$JAVA_HOME/bin\n" >> ~/.zshrc
        source ~/.zshrc
    fi
fi


# Clone common and kyc-api source

mkdir ~/Documents/skipid 
cd ~/Documents/skipid && git clone https://gitlab.com/ultorex/skipid/backend/common.git && git clone https://gitlab.com/ultorex/skipid/backend/kyc-api.git 

# Change staging IP -> 127.0.0.1 (local IP)

cd ~/Documents/skipid/kyc-api/src/main/resources && sed -i s:54.179.113.12:127.0.0.1:g application-dev.properties

# Build kyc-api with gradlew then move file war into webapps folder of tomcat-8.0.53

cd ~/Documents/skipid/kyc-api && ./gradlew build && cd ~/Documents/skipid/kyc-api/build/libs && mv kyc-api-0.0.1-SNAPSHOT.war ~/apache-tomcat-8.0.53/webapps/ && mv ~/apache-tomcat-8.0.53/webapps/kyc-api-0.0.1-SNAPSHOT.war ~/apache-tomcat-8.0.53/webapps/kyc-api.war

# Clone kyc-admin source

cd ~/Documents/skipid && git clone https://gitlab.com/ultorex/skipid/backend/kyc-admin.git && cd ~/Documents/skipid/kyc-admin/config && sed -i s:54.179.113.12:127.0.0.1:g jdbc.properties && sed -i s:54.179.113.12:127.0.0.1:g redis.properties

# Build kyc-admin with ant then move war file to webapps folder of tomcat-8.0.53

cd ~/Documents/skipid/kyc-admin && ~/apache-ant-1.9.16/bin/ant && cd ~/Documents/skipid/kyc-admin/dist && mv hibtc-back.war ~/apache-tomcat-8.0.53/webapps/

# Clone skipid frontend and copy .env (previously add to ~/Documents/utilities folder) to skipid frontend base folder 

cd ~/Documents/skipid && git clone https://gitlab.com/ultorex/skipid/frontend/skipid.git

cd ~/Documents/skipid/skipid && touch .env && cp /home/cuong/Documents/utilities/.env ~/Documents/skipid/skipid/
cd ~/Documents/skipid/skipid && sed -i s:'https\://staging-api.skipid.io':'http\://localhost\:8080/kyc-api':g .env

# Install skipid frontend with yarn

yarn install
sudo yarn global add serve

# Start tomcat server at port 8080

~/apache-tomcat-8.0.53/bin/startup.sh

# Start skipid frontend server at port 3000

cd ~/Documents/skipid/skipid 
yarn build
serve -s build -p 3000 &

# Remove .env file in the utilities folder

rm -rf ~/Documents/utilities/.env
