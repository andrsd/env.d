export CLICOLOR=1

# history
shopt -s histappend
export HISTFILESIZE=10000
export HISTIGNORE="&:exit"

export PS1="$XTITLE"'\[\033[01;32m\]\h\[\033[31m\] $(parse_git_branch)$(parse_svn_branch)\[\033[01;34m\]$\[\033[00m\] '

