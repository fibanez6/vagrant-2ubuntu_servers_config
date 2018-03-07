#!/usr/bin/env bash

HOME_DIR="/home/vagrant"
NODE_VERSION=6.10.1
NVM_VERSION=0.33.8

echo "-------------------- Changing to vagrant user"
export USER=vagrant
export HOME=$HOME_DIR
echo "-------------------- Installing nvm"
echo "curl https://raw.githubusercontent.com/creationix/nvm/v$NVM_VERSION/install.sh"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v$NVM_VERSION/install.sh | bash
echo "-------------------- Changing '$HOME_DIR/.nvm' owner to '$USER' user"
sudo chown -R $USER:$USER $HOME_DIR/.nvm
export NVM_DIR="$HOME_DIR/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
echo "-------------------- Reloading '$HOME_DIR/.bashrc'"
source $HOME_DIR/.bashrc
echo "-------------------- Installing node version '$NODE_VERSION'"
nvm install $NODE_VERSION
nvm alias default $NODE_VERSION