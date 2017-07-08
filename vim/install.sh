#!/usr/bin/env bash

##################
# Install Vundle #
##################
mkdir -p $HOME/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

##############################
# YouCompleteMe requirements #
##############################
ln -s /usr/local/Caskroom/macvim/8.0.120/mvim /usr/local/bin/mvim
ln -s /usr/local/bin/mvim /usr/local/bin/vim

exit 0

