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
fi

# copy custom folder's plugins and themes
cp -R $DOTFILES_ROOT/zsh/custom/themes $HOME/.oh-my-zsh/custom/themes
cp -R $DOTFILES_ROOT/zsh/custom/plugins/zsh-syntax-highlighting $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

#########################################################################
# bullet-train zsh theme requirement: Patched fonts for Powerline users #
#########################################################################
# https://github.com/powerline/fonts
# currently install fonts only at 1st time, tested by existence of .oh-my-zsh folder as above
if ! [ -e $HOME/.oh-my-zsh ]
then
  cd /tmp
  git clone https://github.com/powerline/fonts.git
  cd fonts
  ./install.sh
  cd ..
  rm -rf fonts
fi

exit 0

