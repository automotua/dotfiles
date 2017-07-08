#!/usr/bin/env bash

##########################
# oh-my-zsh installation #
##########################
cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

if ! [ -e $HOME/.oh-my-zsh ]
then
  echo "Installing oh-my-zsh."
  cd $HOME
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  # symbolic link the custom folder
  rm -rf $HOME/.oh-my-zsh/custom
  ln -s $DOTFILES_ROOT/zsh/custom $HOME/.oh-my-zsh/custom
fi

#########################################################################
# bullet-train zsh theme requirement: Patched fonts for Powerline users #
#########################################################################
# https://github.com/powerline/fonts
cd /tmp
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd ..
rm -rf fonts

exit 0

