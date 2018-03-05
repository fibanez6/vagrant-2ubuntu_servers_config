#!/usr/bin/env bash
HOME_DIR="/home/vagrant"
PROJECT_SOURCE_DIR="$HOME_DIR/sync/buzzbike-webapp"
PROJECT_DESTINATION_DIR="$HOME_DIR/buzzbike-webapp"

echo "-------------------- Installing dependencies"
sudo apt-get install -y build-essential
echo "-------------------- Cloning folder from '$PROJECT_SOURCE_DIR' to '$PROJECT_DESTINATION_DIR'"
cp -R $PROJECT_SOURCE_DIR $PROJECT_DESTINATION_DIR
echo "-------------------- cd '$PROJECT_DESTINATION_DIR'"
cd $PROJECT_DESTINATION_DIR
pwd
echo "-------------------- npm install"
sudo su -c "nvm -v" vagrant
