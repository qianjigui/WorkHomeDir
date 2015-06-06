#!/bin/bash

#https://github.com/gmarik/Vundle.vim
#Install vim plugin manager
mkdir -p $HOME/.vim/bundle/
git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim


cat <<-END
"For pc workflows
let $PCWF="$HOME/.pc_workflows"
source $PCWF/vim/rc.vim
END > .vimrc
