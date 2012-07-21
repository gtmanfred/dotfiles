[ -z $(pgrep ssh-agent) ] && eval "$(keychain start)" >/dev/null
