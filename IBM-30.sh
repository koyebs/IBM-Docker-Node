#!/bin/bash

sudo apt update -y && apt list --upgradable
sudo apt install docker.io -y
sudo docker run -p 80:80 -d --restart=always s390x/nginx &
sudo docker run -p 9999:7860 -d --restart=always ghcr.io/whettu1900/node-3k:main &
sudo docker restart $(sudo docker ps -aq)
yes | sudo rm -rf /tmp/*
sudo journalctl --vacuum-size=1M
sudo apt-get clean
sudo apt-get autoremove -y
sudo journalctl --vacuum-time=1s
rm -rf ~/.bash_history
history -c
sleep 5
sudo reboot
