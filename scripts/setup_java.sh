#!/bin/bash

# Install java
mkdir -p /usr/share/man/man1
apt-get update && apt install -y --no-install-recommends openjdk-11-jdk build-essential
