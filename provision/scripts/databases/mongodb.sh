#!/usr/bin/env bash

#Step 1: Import the MongoDB public key
echo "-------------------- Importing the public key used by the package management system"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
#Step 2: Generate a file with the MongoDB repository url
echo "-------------------- Creating a list file for MongoDB"
echo "deb [ arch=amd64 ] http://repo.mongodb.com/apt/ubuntu trusty/mongodb-enterprise/3.6 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-enterprise.list
#Step 3: Refresh the local database with the packages
echo "-------------------- Reloading local package database"
sudo apt-get update
#Step 4: Install the last stable MongoDB version and all the necessary packages on our system
echo "-------------------- Installing mongodb-enterprise"
sudo apt-get install -y mongodb-enterprise
echo "-------------------- Creating folder /data/db/"
sudo mkdir -p /data/db | sudo chown -R $USER /data/db
echo "-------------------- fixing bindIp on mongod.conf"
sudo sed -i "s/bindIp: 127.0.0.1/bindIp: 0.0.0.0/" /etc/mongod.conf