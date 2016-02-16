#!/bin/zsh
# Normal aliases
#alias ls='ls --color=auto -F'
alias lsd='ls -ld *(-/DN)'
alias lsa='ls -ld .*'
alias f='find |grep'
alias dir='ls -1'
alias ..='cd ..'
alias sudo="sudo "

alias rhub='GITHUB_HOST=github.rackspace.com hub'

alias things='for name in "${THINGS[@]}"; do supernova smcore-IAD ssh -i ~/.ssh/ansible --login root --network public ${name}.manfred.io --extra-opts "pkill -9 salt-minon && systemctl restart salt-minion"; done'
alias tthings='for name in "${THINGS[@]}"; do tsocks supernova smcore-IAD ssh -i ~/.ssh/ansible --login root --network public ${name}.manfred.io --extra-opts "-o StrictHostKeyChecking=false -oUserKnownHostsFile=/dev/null systemctl restart salt-minion"; done'
#alias vim='atom'
