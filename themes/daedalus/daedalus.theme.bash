# Sexy Bash Prompt, inspired by "Extravagant Zsh Prompt"
# Screenshot: http://cloud.gf3.ca/M5rG
# A big thanks to \amethyst on Freenode

#if tput setaf 1 &> /dev/null; then
#    if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
#      MAGENTA=$(tput setaf 9)
#      ORANGE=$(tput setaf 172)
#      GREEN=$(tput setaf 190)
#      PURPLE=$(tput setaf 141)
#      WHITE=$(tput setaf 0)
#    else
#      BLACK=$(tput setaf 0)
#      RED=$(tput setaf 1)
#      GREEN=$(tput setaf 2)
#      YELLOW=$(tput setaf 3)
#      BLUE=$(tput setaf 4)
#      MAGENTA=$(tput setaf 5)
#      CYAN=$(tput setaf 6)
#      WHITE=$(tput setaf 7)
#      TEST=$(tput setaf 172)
#    fi
#    BOLD=$(tput bold)
#    RESET=$(tput sgr0)
#else
    LIGHT_RED="\033[1;31m"
    LIGHT_GREEN="\033[1;32m"
    YELLOW="\033[1;33m"
    LIGHT_BLUE="\033[1;34m"
    LIGHT_PURPLE="\033[1;35m"
    LIGHT_CYAN="\033[1;36m"
    WHITE="\033[1;37m"
    RED="\033[0;31m"
    GREEN="\033[0;32m"
    BROWN="\033[0;33m"
    BLUE="\033[0;34m"
    PURPLE="\033[0;35m"
    CYAN="\033[0;36m"
    LIGHT_GRAY="\033[0;37m"
    BOLD=""
    RESET="\033[m"
#fi

parse_git_dirty () {
  [[ $(git status 2> /dev/null | tail -n1 | cut -c 1-17) != "nothing to commit" ]] && echo "*"
}
parse_git_branch () {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

function prompt_command() {
  PS1="\[${BOLD}$LIGHT_BLUE\]\u@\h\[$WHITE\]:\[$BLUE\]\w\[$WHITE\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$LIGHT_CYAN\]\$(parse_git_branch)\[$WHITE\]\n\$ \[$RESET\]"
}

safe_append_prompt_command prompt_command
