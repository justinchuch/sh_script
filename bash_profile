# my .bash_profile for macos
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

alias ls="ls -Gh"

# cleanup .DS_Store
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"

# use sublime
alias edit="subl"

# github access token
export HOMEBREW_GITHUB_API_TOKEN=

# change terminal title
alias ttitle="printf '\033]0;%s\007'"
