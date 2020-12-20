#!/bin/bash

VIM_VERSION=$(vim --version | head -1 | cut -d ' ' -f 5)
HAS_PYTHON3=$(vim --version | grep -c '+python3')
GCC_VERSION=$(gcc --version | head -1 | cut -d ' ' -f 4 | head -c 1)

function check_vim {
    ## Get latest version of vim
    if [ ! $(echo "$VIM_VERSION < 8.2" | bc -l) ]; then
        echo "Upgrading vim"
        sudo add-apt-repository ppa:jonathonf/vim -y
        sudo apt update
        sudo apt install vim -y
    fi
}

function check_python_support {
    if [ ! $HAS_PYTHON3 ]; then
        echo "ERROR: vim must have (only) python3 enabled"
        exit 1
    fi
}

function check_gcc {
    ## Install latest version of gcc / g++
    if [ ! $(echo "$GCC_VERSION < 8" | bc -l) ]; then
        echo "Upgrading gcc and g++"
        sudo apt install gcc-8 g++-8 -y
        sudo rm /usr/bin/gcc
        sudo ln -s /usr/bin/gcc-8 /usr/bin/gcc
        sudo rm /usr/bin/g++
        sudo ln -s /usr/bin/g++-8 /usr/bin/g++
    fi
}

function install_plugins {
    ## Install vim plug
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    ## Copy .vimrc and install plugins
    if test -f "~/.vimrc"; then
        cp ~/.vimrc ~/.vimrc_bkup
    fi
    cp .vimrc ~/
    vim +'PlugInstall --sync' +qa

    ## Build YouCompleteMe
    cd ~/.vim/plugged/YouCompleteMe
    chmod +x install.sh
    ./install.py
}

check_vim
check_python_support
check_gcc
install_plugins
