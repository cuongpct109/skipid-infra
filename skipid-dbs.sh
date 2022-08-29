#!/bin/sh
rm -rf ~/Documents/dbs ~/Downloads/dbs ~/Downloads/datastack ~/Downloads/datastack.zip && sudo apt update; sudo apt install -y wget && wget --load-cookies ~/Downloads/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies ~/Downloads/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1vF98vquW-F_en-4YFCimES84WeE1AcNY' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1vF98vquW-F_en-4YFCimES84WeE1AcNY" -O ~/Downloads/datastack.zip && rm -rf ~/Downloads/cookies.txt && unzip ~/Downloads/datastack.zip -d ~/Downloads/datastack && cd ~/Documents && git clone https://gitlab.com/ultorex/skipid/backend/dbs.git && rsync -a ~/Downloads/datastack/ ~/Documents/dbs/ && sudo apt install -y docker && sudo apt install -y docker-compose && sudo systemctl enable docker.service && sudo systemctl enable containerd.service && sudo systemctl restart docker.service && sudo systemctl restart containerd.service && cd ~/Documents/dbs && docker-compose up 2>/dev/null & sudo apt autoremove; rm -rf ~/Downloads/skipid-infra ~/Downloads/datastack* 

