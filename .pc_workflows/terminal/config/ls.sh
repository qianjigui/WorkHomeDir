if [ $PCWF_IS_MACOSX ];
then
alias ls='ls -G'
fi

if [ $PCWF_IS_LINUX ];
then
alias ls='ls --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'



