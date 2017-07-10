# my .bash_profile for macos
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]"
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


# current git branch [Start]
current_git_branch() {
	BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
	if [[ -z "$BRANCH" ]]; then
		echo ""
	else
		BRANCH_COLOR='\033[32m' # Green
		NC='\033[0m' # No Color
		echo -e "${BRANCH_COLOR}($BRANCH)${NC}"
	fi
}
export PS1=$PS1"\$(current_git_branch)\$ "
# current git branch [End]
