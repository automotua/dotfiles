#!/usr/bin/env bash

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

#############################
# Copy over ssh config file #
#############################
if ! [-e $HOME/.ssh/config ]
then
  mkdir -p $HOME/.ssh
  cp config $HOME/.ssh/config
else
  echo ""
  echo "~/.ssh/config file already exists. Make sure the config files are properly merged. \n"
fi

exit 0

