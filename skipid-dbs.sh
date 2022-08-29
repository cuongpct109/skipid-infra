#!/bin/zsh
sudo apt update
&& sudo apt install -y wget
&& sudo apt install -y curl
&& wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1vF98vquW-F_en-4YFCimES84WeE1AcNY' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1vF98vquW-F_en-4YFCimES84WeE1AcNY" -O ~/Downloads/datastack.zip 
&& rm -rf /tmp/cookies.txt 
&& unzip ~/Downloads/datastack.zip -d ~/Downloads/datastack 
&& git clone https://gitlab.com/ultorex/skipid/backend/dbs.git ~/Downloads/dbs 
&& cp --preserve -r ~/Downloads/datastack/* ~/Downloads/dbs 
&& rm -rf ~/Downloads/datastack ~/Downloads/datastack.zip 
&& sudo apt install -y docker 
&& sudo apt install -y docker-compose 
&&  sudo systemctl enable docker.service 
&& sudo systemctl enable containerd.service 
&& sudo systemctl start docker.service 
&& sudo systemctl start containerd.service 
&& cd dbs && sudo docker-compose up >> /dev/null &

