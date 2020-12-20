# vimrc
my vimrc

## Installation

The below installation instructions were tested on Ubuntu 18.04 LTS.

0. Make sure your version of vim is at least `8.2`. These are the steps to upgrade:

`$ sudo add-apt-repository ppa:jonathonf/vim`  
`$ sudo apt update`  
`$ sudo apt install vim`

1. Make sure your gcc/g++ version is at least 8 (this is required for 
the vim plugin `YouCompleteMe`. If it's below (`$gcc --version`) 
run   
`$ sudo apt install gcc-8 g++-8`  
`$ sudo rm /usr/bin/gcc`  
`$ sudo ln -s /usr/bin/gcc-8 /usr/bin/gcc`  
`$ sudo rm /usr/bin/g++`  
`$ sudo ln -s /usr/bin/g++-8 /usr/bin/g++`  


2. Download [vim plug](https://github.com/junegunn/vim-plug):   
   ```
   curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   ```

3. Copy `.vimrc` from this repo into  `~/.vimrc` open it and run `:PlugInstall`  

4. Compile YouCompleteMe:   
```
cd ~/.vim/plugged/YouCompleteMe
./install.py
```


