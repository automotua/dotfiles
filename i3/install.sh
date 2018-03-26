#!/usr/bin/env bash

###################################
# i3 installation (only on Linux) #
###################################
if [ "$(uname -s)" != "Linux" ]
then
  exit 0
fi

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

# install i3
if ! [ -e $HOME/.i3 ]
then
  apt-get update
  apt-get install i3 -y
fi

if ! [ -e $HOME/.i3 ]
then
  mkdir $HOME/.i3
fi

# symlinked files under .i3 folder. i3status.config will be linked like other
# symlinks under $HOME
rm -rf $HOME/.i3/config $HOME/.i3/workspace-swap.py
ln -s $DOTFILES_ROOT/i3/config $HOME/.i3/config
ln -s $DOTFILES_ROOT/i3/workspace-swap.py $HOME/.i3/workspace-swap.py

exit 0
