# Add yourself some shortcuts to projects you often work on
# Example:
#
# brainstormr=/Users/robbyrussell/Projects/development/planetargon/brainstormr
#
# curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
#

plugins=(rails ruby tmux git gradle command-not-found rake go)
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

echo "WPC zsh script setting"
###for bash

#For MAC OSX

##Golang
MAC_GO_ROOT=/usr/local/go
if [ -d $MAC_GO_ROOT ]; then
    echo "Add golang"
    export PATH=$PATH:$MAC_GO_ROOT/bin
    export GOROOT=$MAC_GO_ROOT
fi

##Android SDK
ANDROID_SDK_DIR=$HOME/Library/Android/sdk
ANDROID_PLATFORM_TOOLS=$ANDROID_SDK_DIR/platform-tools
ANDROID_BUILD_TOOLS=$ANDROID_SDK_DIR/build-tools
if [ -d $ANDROID_PLATFORM_TOOLS ]; then
    echo "Add Android SDK platform tools"
    export PATH=$ANDROID_PLATFORM_TOOLS:$PATH
fi

if [ -d $ANDROID_BUILD_TOOLS ]; then
    ANDROID_BUILD_TOOLS_LATEST_VERSION=$(ls $HOME/Library/Android/sdk/build-tools/ | sort | tail -1)
    ANDROID_BUILD_TOOLS=$ANDROID_BUILD_TOOLS/$ANDROID_BUILD_TOOLS_LATEST_VERSION
    if [ -d $ANDROID_BUILD_TOOLS ]; then
        echo "Add Android SDK Build tools"
        export PATH=$ANDROID_BUILD_TOOLS:$PATH
    fi
fi

