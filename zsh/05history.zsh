HISTFILE="$HOME/.zsh/zhistory"
HISTSIZE=1500
SAVEHIST=1000
setopt inc_append_history
setopt append_history
setopt bang_hist
setopt extended_history
setopt no_hist_allow_clobber
setopt no_hist_beep
setopt hist_expire_dups_first
[[ $ZSH_VERSION != 4.2.6 ]] && setopt hist_fcntl_lock
setopt hist_find_no_dups
setopt no_hist_ignore_dups
setopt hist_ignore_space
setopt no_hist_no_functions
setopt hist_no_store
setopt hist_reduce_blanks
[[ $ZSH_VERSION != 4.2.6 ]] && setopt hist_save_by_copy
setopt hist_save_no_dups
setopt no_hist_verify
setopt no_inc_append_history
setopt share_history
# changing dirs
setopt auto_cd
setopt no_auto_pushd
setopt cdable_vars
# setopt chase_dots # chase_links implies this
setopt chase_links
setopt pushd_ignore_dups
setopt no_pushd_minus
setopt pushd_silent
setopt pushd_to_home

