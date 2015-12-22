export EDITOR=vim
set -o vi

if [ $LOCALVIM ]; then
    echo "Add vim"
    export PATH=$LOCALVIM/bin:$PATH
fi
