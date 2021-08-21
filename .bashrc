[[ $- != *i* ]] && return
PS1='\e[00;36m\W \$ '

alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias mkdir='mkdir -v'
alias rmdir='rmdir -v'
alias ls='ls -la --color=auto'
alias grep='grep --color=auto'
