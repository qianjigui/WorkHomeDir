
pcwf_reload_zsh() {
    source $HOME/.zshrc
}

pcwf_reload_bash() {
    source $HOME/.bashrc
}

pcwf_reload_tmux() {
    tmux source-file $HOME/.tmux.conf
}

