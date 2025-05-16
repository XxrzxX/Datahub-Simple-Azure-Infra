#!/bin/bash

# Install basic tools
sudo apt update
sudo apt install -y wget git curl software-properties-common

# Install Python 3.11 and venv module
sudo apt install -y python3.11 python3.11-venv python3.11-dev

# Upgrade pip for Python 3.11
python3.11 -m ensurepip --upgrade
python3.11 -m pip install --upgrade pip



