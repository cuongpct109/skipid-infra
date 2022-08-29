#!/bin/sh

kill -9 $(lsof -i tcp:3000 | grep node | awk '{ print $2 }' | uniq) 2>/dev/null && kill -9 $(lsof -i tcp:8080 | grep java | awk '{print $2}' | uniq) 2>/dev/null
rm -rf ~/Documents/skipid ~/apache-tomcat-8.0.53* ~/apache-ant-1.9.16
sudo apt update && cd ~ && wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.0.53/bin/apache-tomcat-8.0.53.zip && unzip -o apache-tomcat-8.0.53.zip && rm apache-tomcat-8.0.53.zip && chmod +x ~/apache-tomcat-8.0.53/bin/catalina.sh ~/apache-tomcat-8.0.53/bin/startup.sh ~/apache-tomcat-8.0.53/bin/shutdown.sh
cd ~ && wget https://dlcdn.apache.org//ant/binaries/apache-ant-1.9.16-bin.zip && unzip -o apache-ant-1.9.16-bin.zip && rm apache-ant-1.9.16-bin.zip && chmod +x ~/apache-ant-1.9.16/bin/ant ~/apache-ant-1.9.16/bin/antRun
mkdir ~/Documents/skipid && cd ~/Documents/skipid && git clone https://gitlab.com/ultorex/skipid/backend/common.git && git clone https://gitlab.com/ultorex/skipid/backend/kyc-api.git && cd ~/Documents/skipid/kyc-api && ./gradlew build && cd ~/Documents/skipid/kyc-api/build/libs && mv kyc-api-0.0.1-SNAPSHOT.war ~/apache-tomcat-8.0.53/webapps/ && mv ~/apache-tomcat-8.0.53/webapps/kyc-api-0.0.1-SNAPSHOT.war ~/apache-tomcat-8.0.53/webapps/kyc-api.war
cd ~/Documents/skipid && git clone https://gitlab.com/ultorex/skipid/backend/kyc-admin.git && cd ~/Documents/skipid/kyc-admin && ~/apache-ant-1.9.16/bin/ant && cd ~/Documents/skipid/kyc-admin/dist && mv hibtc-back.war ~/apache-tomcat-8.0.53/webapps/
cd ~/Documents/skipid && git clone https://gitlab.com/ultorex/skipid/frontend/skipid.git && cd ~/Documents/skipid/skipid && touch .env && cp ~/Documents/utilities/.env ~/Documents/skipid/skipid/
yarn install
~/apache-tomcat-8.0.53/bin/startup.sh
cd ~/Documents/skipid/skipid && yarn start & 
rm -rf ~/Downloads/skipid-infra
