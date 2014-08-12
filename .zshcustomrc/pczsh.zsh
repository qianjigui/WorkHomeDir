# Add yourself some shortcuts to projects you often work on
# Example:
#
# brainstormr=/Users/robbyrussell/Projects/development/planetargon/brainstormr
#
# curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
#

plugins=(rails ruby tmux git gradle command-not-found rake repo sudo)
export EDITOR=vi
setopt append_history no_inc_append_history no_share_history
bindkey -v
export ZSH_THEME=blinks
export DISABLE_AUTO_TITLE=true
bindkey '^R' history-incremental-search-backward
export HIST_STAMPS="mm/dd/yyyy"

__git_files () {
    _wanted files expl 'local files' _files
}
