# This was written entirely by Mikael Magnusson (Mikachu)
# Basically type '...' to get '../..' with successive .'s adding /..
rationalise-dot() {
    local MATCH # keep the regex match from leaking to the environment
    if [[ $LBUFFER =~ '(^|/| |      |'$'\n''|\||;|&)\.\.$' ]]; then
      LBUFFER+=/
      zle self-insert
      zle self-insert
    else
      zle self-insert
    fi
}
zle -N rationalise-dot
bindkey . rationalise-dot
# without this, typing a . aborts incremental history search
bindkey -M isearch . self-insert
