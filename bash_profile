# my .bash_profile for macos
#
# reference from http://ezprompt.net/
# get current branch in git repo
function parse_git_branch {
  BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
  if [ ! "${BRANCH}" == "" ]
  then
    STAT=`parse_git_dirty`
    echo "[${BRANCH}${STAT}]"
  else
    echo ""
  fi
}

# get current status of git repo
function parse_git_dirty {
  status=`git status 2>&1 | tee`
  dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
  untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
  ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
  newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
  renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
  deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
  bits=''
  if [ "${renamed}" == "0" ]; then
    bits=">${bits}"
  fi
  if [ "${ahead}" == "0" ]; then
    bits="*${bits}"
  fi
  if [ "${newfile}" == "0" ]; then
    bits="+${bits}"
  fi
  if [ "${untracked}" == "0" ]; then
    bits="?${bits}"
  fi
  if [ "${deleted}" == "0" ]; then
    bits="x${bits}"
  fi
  if [ "${dirty}" == "0" ]; then
    bits="!${bits}"
  fi
  if [ ! "${bits}" == "" ]; then
    echo " ${bits}"
  else
    echo ""
  fi
}

# tput color
# Black = 0
# Red = 1
# Green = 2
# Yellow = 3
# Blue = 4
# Magenta = 5
# Cyan = 6
# White = 7
# Reset to default color = 9

green=$(tput setaf 2)
yellow=$(tput setaf 3)
high_yellow="\033[38;5;11m"
cyan=$(tput setaf 6)
reset=$(tput sgr0)
export PS1='\[$cyan\]\u\[$reset\]@\[$reset\]\h\[$reset\]:\['${high_yellow}'\]\w\[$green\]`parse_git_branch`\[$reset\]> '

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# ls
alias ls="ls -Gh"
alias ll="ls -lhA"

# cleanup .DS_Store
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"

# use sublime
alias edit="subl"

# change terminal title
function setTTitle {
  printf "\033]0;%s\007" "$1"
}

# github access token
export HOMEBREW_GITHUB_API_TOKEN=
