#!/bin/bash

# Node
curl -sL https://deb.nodesource.com/setup_14.x | bash -
apt-get update && apt-get install -y nodejs

# Yarn
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
apt-get update && apt-get install -y yarn
