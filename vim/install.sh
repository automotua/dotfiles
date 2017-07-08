#!/usr/bin/env bash

##################
# Install Vundle #
##################
if ! [ -e $HOME/.vim/bundle/Vundle.vim ]
then
  mkdir -p $HOME/.vim/bundle
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

##############################
# YouCompleteMe requirements #
##############################
if ! [ -e /usr/local/bin/vim ]
then
  ln -s /usr/local/bin/mvim /usr/local/bin/vim
fi

exit 0

