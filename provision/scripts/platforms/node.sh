#!/usr/bin/env bash

NODE_VERSION=6.x

echo "-------------------- Reloading local package database"
sudo apt-get update
echo "-------------------- Getting node js version '$NODE_VERSION'"
curl -sL https://deb.nodesource.com/setup_$NODE_VERSION | sudo -E bash -
echo "-------------------- Installing nodejs"
sudo apt-get install -y nodejs
echo "-------------------- Installing some libraries"
sudo apt-get install -y build-essential libssl-dev