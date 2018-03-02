#!/usr/bin/env bash

NODE_VERSION=6.10.1
NVM_VERSION=0.33.8

echo "-------------------- Installing nvm"
echo "curl https://raw.githubusercontent.com/creationix/nvm/v$NVM_VERSION/install.sh"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v$NVM_VERSION/install.sh | bash
echo "-------------------- Reloading .bashrc"
source .bashrc
echo "-------------------- Installing node version '$NODE_VERSION'"
nvm install $NODE_VERSION