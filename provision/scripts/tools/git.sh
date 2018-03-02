#!/usr/bin/env bash

echo "-------------------- Reloading local package database"
sudo apt-get update
echo "-------------------- Installing git"
sudo apt-get install -y git