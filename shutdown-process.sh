#!/bin/sh
echo "\n"
rm -rf ~/Downloads/skipid-infra 
cd ~/Downloads 
echo "cloning skipid-infra source code from github/cuongpct109/skipid-infra"
echo "==============================="
git clone https://github.com/cuongpct109/skipid-infra.git > /dev/null 2>&1 
sh ~/Downloads/skipid-infra/shutdown.sh
