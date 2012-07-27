my_extended_wordchars='*?_-.[]~=&;!#$%^(){}<>:@,\\';
my_extended_wordchars_space="${my_extended_wordchars} "
my_extended_wordchars_slash="${my_extended_wordchars}/"

# is the current position \-quoted ?
function is_quoted(){
 test "${BUFFER[$CURSOR-1,CURSOR-1]}" = "\\"
}

unquote-forward-word(){
    while is_quoted
      do zle .forward-word
    done
}

unquote-backward-word(){
    while  is_quoted
      do zle .backward-word
    done
}

backward-to-space() {
    local WORDCHARS=${my_extended_wordchars_slash}
    zle .backward-word
    unquote-backward-word
}

forward-to-space() {
     local WORDCHARS=${my_extended_wordchars_slash}
     zle .forward-word
     unquote-forward-word
}

backward-to-/ () {
    local WORDCHARS=${my_extended_wordchars}
    zle .backward-word
    unquote-backward-word
}

forward-to-/ () {
     local WORDCHARS=${my_extended_wordchars}
     zle .forward-word
     unquote-forward-word
}

zle -N backward-to-space
zle -N forward-to-space
zle -N backward-to-/
zle -N forward-to-/

bindkey "^[^b" backward-to-space
bindkey "^[^f" forward-to-space
bindkey "^[/" forward-to-/
bindkey "^[\\" backward-to-/
