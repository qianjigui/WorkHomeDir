# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
[ -x shopt ] && shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
