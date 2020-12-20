#!/bin/bash

## Get latest version of vim
sudo add-apt-repository ppa:jonathonf/vim -y
sudo apt update
sudo apt install vim -y


## Install latest version of gcc / g++
sudo apt install gcc-8 g++-8 -y
sudo rm /usr/bin/gcc
sudo ln -s /usr/bin/gcc-8 /usr/bin/gcc
sudo rm /usr/bin/g++
sudo ln -s /usr/bin/g++-8 /usr/bin/g++

## Install vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

## Copy .vimrc and install plugins
cp .vimrc ~/
vim +'PlugInstall --sync' +qa

## Build YouCompleteMe
cd ~/.vim/plugged/YouCompleteMe
./install.py
