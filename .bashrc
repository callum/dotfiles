_pwd_short() {
  echo $PWD | sed "s:${HOME}:~:" | sed "s:/\(.\)[^/]*:/\1:g" | sed "s:/[^/]*$:/$(basename $PWD):"
}

if [ -f /etc/profile ]; then
  source /etc/profile
fi

if [ -f /usr/local/etc/bash_completion ]; then
  source /usr/local/etc/bash_completion
fi

eval "$(hub alias -s)"

export GIT_PS1_SHOWDIRTYSTATE=1
export HISTCONTROL=ignoreboth
export HISTFILESIZE=1000000
export HISTSIZE=1000000
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
export PS1='$(_pwd_short)$(__git_ps1 " (%s)") $ '
