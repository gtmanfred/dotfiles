# Path to your oh-my-zsh configuration.
setopt autocd

autoload -Uz compinit 
compinit
fpath=($HOME/.zsh/completion $fpath)
path=($HOME/.scripts $path)
#typeset -U path fpath


typeset -g -A key
#eval "$(sed -n 's/^/bindkey /; s/: / /p' /etc/inputrc)"

if [ -f ~/.zalias ]; then
    source ~/.zalias
fi
source $HOME/.private/zshstuff

DISABLE_AUTO_TITLE="true"

setopt nocorrectall
for f in $HOME/.zsh/*.zsh; do
	source $f
done

autoload -U edit-command-line
zle -N edit-command-line
export EDITOR=vim
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
bindkey "^X" edit-command-line
export _humblebundleVkey=G7T74bUUZKSH   
# Customize to your needs...

HOSTFILE=~/.hosts
export BROWSER=dwb

function src()
{
        autoload -U zrecompile
                [ -f ~/.zshrc ] && zrecompile -p ~/.zshrc
                [ -f ~/.zcompdump ] && zrecompile -p ~/.zcompdump
                #[ -f ~/.zcompdump ] && zrecompile -p ~/.zcompdump
                [ -f ~/.zshrc.zwc.old ] && rm -f ~/.zshrc.zwc.old
                [ -f ~/.zcompdump.zwc.old ] && rm -f ~/.zcompdump.zwc.old
                source ~/.zshrc
}


function uploadImage {
	apikey=$(awk '/imgur/ {print $2}' /etc/imgurrc)
  curl -s -F "image=@$1" -F "key=$apikey" http://imgur.com/api/upload.xml | grep -E -o "<original_image>(.)*</original_image>" | grep -E -o "http://i.imgur.com/[^<]*"
  }
zstyle ':completion:*:*:vim:*:all-files' ignored-patterns '*.class|*.jpeg'
setopt completealiases
#export PATH=/home/daniel/.cabal/bin:$PATH:$HOME/.scripts:/opt/android-sdk/platform-tools/
export CLASSPATH=$CLASSPATH:/usr/share/java/bsh.jar

export MPD_HOST=24.98.68.157
export MPD_PORT=6600
