bindkey -e
bindkey '\ew' kill-region
bindkey -s '\el' "ls\n"
bindkey '^r' history-incremental-search-backward
bindkey "^[[5~" up-line-or-history
bindkey "^[[6~" down-line-or-history
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# make search up and down work, so partially type and hit up/down to find relevant stuff
bindkey "^[[H" beginning-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[OH" beginning-of-line
bindkey "^[[F"  end-of-line
bindkey "^[[4~" end-of-line
bindkey "^[OF" end-of-line
bindkey ' ' magic-space    # also do history expansion on space

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

bindkey '^[[Z' reverse-menu-complete

# Make the delete key (or Fn + Delete on the Mac) work instead of outputting a ~
bindkey '^?' backward-delete-char
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char
bindkey "\e[3~" delete-char

bindkey -M vicmd v edit-command-line
#bindkey "^[[A" history-beginning-search-backward
#bindkey "^[[B" history-beginning-search-forward
bindkey "^X" edit-command-line

backward-kill-to-/(){
    local WORDCHARS=${my_extended_wordchars}
    zle .backward-kill-word
}
zle -N backward-kill-to-/
bindkey "^F" backward-kill-to-/
