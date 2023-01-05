#!/bin/bash

# Script to setup some things for accessing Bitbucket using SSH key provided through Docker buildkit.
mkdir -p ~/.ssh
touch ~/.ssh/known_hosts

apt-get update -y
apt-get install -y openssh-client
ssh-keyscan -p 7999 $1 >> ~/.ssh/known_hosts

rm -rf /var/lib/apt/lists/*
apt-get purge --auto-remove
apt-get clean

pip install --upgrade pip setuptools wheel && pip -V
