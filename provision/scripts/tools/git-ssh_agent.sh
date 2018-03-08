#!/usr/bin/env bash

HOME_DIR="/home/vagrant"

# PRE: id_rsa and id_rsa.pub must exist in /home/vagrant/.ssh
echo "-------------------- Updating permissions"
sudo chmod 600 $HOME_DIR/.ssh/id_rsa | sudo chmod 644 $HOME_DIR/.ssh/id_rsa.pub
echo "-------------------- Starting ssh-agent"
eval `ssh-agent -s`
echo "-------------------- Adding SSH key to the ssh-agent"
ssh-add /home/vagrant/.ssh/id_rsa