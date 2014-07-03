#!/bin/sh

# Quick bash script to install latest Vim on Ubuntu
# =================================================
# Maintainers: Marco Kellershoff <me@walialu.com>

sudo apt-get update && sudo apt-get install python-software-properties
sudo apt-add-repository ppa:fcwu-tw/ppa
sudo apt-get update && sudo apt-get install vim
