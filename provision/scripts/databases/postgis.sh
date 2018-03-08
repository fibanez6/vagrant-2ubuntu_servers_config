#!/usr/bin/env bash

echo "-------------------- Adding postgis repository"
sudo add-apt-repository -y ppa:ubuntugis/ppa
sudo apt-get update
echo "-------------------- Installing postgis"
sudo apt-get -y install postgis