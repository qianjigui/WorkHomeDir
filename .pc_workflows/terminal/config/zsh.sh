# Add yourself some shortcuts to projects you often work on
# Example:
#
# brainstormr=/Users/robbyrussell/Projects/development/planetargon/brainstormr
#
# curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
#

if [ $PCWF_IS_ZSH ];
then
    echo "Load zsh"
    plugins=(rails ruby tmux git gradle command-not-found rake go)
    export ZSH_THEME=blinks
    export DISABLE_AUTO_TITLE=true
    __git_files () {
        _wanted files expl 'local files' _files
    }
fi
