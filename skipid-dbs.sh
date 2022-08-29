#!/bin/sh
rm -rf ~/Documents/dbs ~/Downloads/dbs ~/Downloads/datastack ~/Downloads/datastack.zip 
sudo apt update; sudo apt install -y wget && wget --load-cookies ~/Downloads/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies ~/Downloads/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1qmD2wgyzJzRC875fiuIr0Z6CIIJ4Ws1A' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1qmD2wgyzJzRC875fiuIr0Z6CIIJ4Ws1A" -O ~/Downloads/datastack.tar.gz && rm ~/Downloads/cookies.txt
cd ~/Downloads && cd ~/Downloads && tar -xvf datastack.tar.gz && cd ~/Documents && git clone https://gitlab.com/ultorex/skipid/backend/dbs.git && rsync -a ~/Downloads/DataStack/ ~/Documents/dbs/
sudo apt install -y docker && sudo apt install -y docker-compose && sudo systemctl enable docker.service && sudo systemctl enable containerd.service && sudo systemctl restart docker.service && sudo systemctl restart containerd.service && cd ~/Documents/dbs && sudo docker-compose up > /dev/null & 
sudo apt autoremove; rm -rf ~/Downloads/skipid-infra ~/Downloads/DataStack ~/Downloads/datastack.tar.gz 
