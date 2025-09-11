export PATH="/mnt/sharedlocal/home/.local/bin:$PATH"
export PATH="/mnt/sharedlocal/home/bin:$PATH"
export PS1='\[\e[1;30;47m\][\W]\[\e[0m\]\[\e[1;31m\]\$\[\e[0m\] '

# Alias{{{
alias tree='tree --dirsfirst -F'
alias h='history'
alias ..="cd .."
alias mkdir="mkdir -pv"
alias ll="ls -l"
alias la="ls -A"
alias cp='cp -v'
alias rm='rm -v'
alias mv='mv -v'

#{{{ git
alias git='git'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
alias gl='git log --oneline'
alias gb='git checkout -b'
alias gd='git diff'
#}}}#}}}

man() {
		lynx https://www.man7.org/linux/man-pages/
}


