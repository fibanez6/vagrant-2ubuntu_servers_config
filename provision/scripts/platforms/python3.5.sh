#!/usr/bin/env bash

echo "-------------------- Adding ppa:deadsnakes/ppa repository"
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt-get update

echo "-------------------- Installing python3.5, pip3 and build-essential"
sudo apt-get install -y python3.5 python3-pip build-essential
echo "-------------------- Installing python libraries"
sudo apt-get install -y python-dev python3.5-dev

echo "-------------------- Installing virtualenv"
sudo pip3 install virtualenv
echo "-------------------- Installing environment python3 in /home/vagrant/venv/"
virtualenv -p python3.5 /home/vagrant/venv

echo "-------------------- Set vagrant owner to venv"
sudo chown -R vagrant:vagrant /home/vagrant/venv
