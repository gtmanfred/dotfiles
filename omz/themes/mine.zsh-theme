function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}
function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '╘═😸 ' && return
    echo '└─╼ '
}
function battery_charge {
    echo `~/.scripts/battery.py` 2>/dev/null
}
function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}
function hg_prompt_info {
    hg prompt --angle-brackets "\
< on %{$fg[magenta]%}<branch>%{$reset_color%}>\
< at %{$fg[yellow]%}<tags|%{$reset_color%}, %{$fg[yellow]%}>%{$reset_color%}>\
%{$fg[green]%}<status|modified|unknown><update>%{$reset_color%}<
patches: <patches|join( → )|pre_applied(%{$fg[yellow]%})|post_applied(%{$reset_color%})|pre_unapplied(%{$fg_bold[black]%})|post_unapplied(%{$reset_color%})>>" 2>/dev/null
}
autoload -U colors && colors
for COLOR in BLACK RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
  	eval PR_$COLOR='%{$fg[${(L)COLOR}]%}'        
   	eval PR_BRIGHT_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
done                                                
PR_RESET="%{${reset_color}%}";
#PROMPT='%{$fg[PR_BRIGHT_GREEN]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%} in %{$fg_bold[green]%}$(collapse_pwd)%{$reset_color%}$(git_prompt_info)
PROMPT='┌─ ${PR_BRIGHT_GREEN}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%} in %{$fg_bold[green]%}$(collapse_pwd)%{$reset_color%}$(git_prompt_info)$(git_prompt_status)
%{$reset_color%}$(virtualenv_info)$(prompt_char)'
#RPROMPT='%{$reset_color%}%{$fg[red]%}%(?.. [%?]) %{$reset_color%}%'
#RPROMPT='%(?,:%),:()'  
RPROMPT='%(?,%F{green}(⌐■_■),%F{yellow}%? %F{red}（╯°□°）╯︵ ┻━┻)%f'
#RPROMPT='$(battery_charge)'
ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""
