#!/bin/bash

# Node
apt-get update && \
  curl -sL https://deb.nodesource.com/setup_14.x | bash && \
  apt-get install nodejs

# Yarn
npm install -g yarn
