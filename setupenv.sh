#!/bin/bash

#install python
sudo apt update
sudo apt-get install python-is-python3 -y
#install lip
pip install torch torchvision

#install git
sudo apt install git-all

git clone https://github.com/bowenc0221/panoptic-deeplab.git
