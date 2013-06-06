# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

BASH_PATH=/bin/bash
if [ -f $BASH_PATH ]; then
    export SHELL=$BASH_PATH
fi

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

OPT_JDK_BIN="/opt/jdk1.6.0_35/bin"
if [ -d $OPT_JDK_BIN ]; then
    PATH="$OPT_JDK_BIN:$PATH"
fi

LOCAL_ERLANG=/usr/local/erlang/bin
if [ -d "$LOCAL_ERLANG" ]; then
  PATH="$LOCAL_ERLANG:$PATH"
fi

LOCAL_RUBY=/usr/local/ruby/bin
if [ -d "$LOCAL_RUBY" ]; then
  PATH="$LOCAL_RUBY:$PATH"
fi

ANDROID_TOOLS="$HOME/workspace/android-sdk-linux/platform-tools"
if [ -d $ANDROID_TOOLS ]; then
    PATH="$ANDROID_TOOLS:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
export LANG="en_US.utf8"

