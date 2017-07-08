#!/usr/bin/env bash

#############################
# Copy over ssh config file #
#############################
if ! [ -e $HOME/.ssh/config ]
then
  mkdir -p $HOME/.ssh
  cp config $HOME/.ssh/config
else
  echo ""
  echo "~/.ssh/config file already exists. Make sure the config files are properly merged."
fi

exit 0

