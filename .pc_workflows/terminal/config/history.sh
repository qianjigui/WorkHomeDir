# avoid duplicates..
export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=8000
export HISTFILESIZE=16000
export HISTTIMEFORMAT="%Y/%m/%d %T "
export HIST_STAMPS="mm/dd/yyyy"
pcwf_cmd bindkey -v
pcwf_cmd bindkey '^R' history-incremental-search-backward
pcwf_cmd setopt append_history no_inc_append_history no_share_history
