#!/bin/bash

#install curl, git
#curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
BOOTSTRAPS="source $HOME/.pc_workflows/bootstraps.sh"
echo $BOOTSTRAPS >> $HOME/.oh-my-zsh/custom/pcwf.zsh
echo $BOOTSTRAPS >> $HOME/.bashrc
