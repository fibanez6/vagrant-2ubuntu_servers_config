#!/usr/bin/env bash
echo "-------------------- Installing nvm"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
echo "-------------------- Reloading .bashrc"
source .bashrc
