source "$HOME/.bash_functions"
source "$HOME/.bash_aliases"

# Could be changed to use .bashrc 
[ ! -f "$HOME/.bash_profile.local" ] || . "$HOME/.bash_profile.local"

# Shhh with the zsh
export BASH_SILENCE_DEPRECATION_WARNING=1

GREEN="\[\033[01;32m\]"
BLUE="\[\033[01;34m\]"
RED="\[\033[01;31m\]"
NOC="\[\033[0m\]"

#Set the prompt red if you sudo into root

if [ $USER != 'root' ]; then
  ps1c=$GREEN
else
  ps1c=$RED
fi
# Prompt with current path
[ -z "$PS1" ] || export PS1="$ps1c\u @ \h $NOC: $BLUE\w $NOC$ "


PATH=$PATH:$HOME/bin             # Add my bin to the PATH
export PATH

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

HISTTIMEFORMAT="%F %T: "
shopt -s histappend
HISTFILESIZE=999999
HISTSIZE=999999
HISTCONTROL=ignoreboth
export PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.logs/bash-history-$(date "+%Y-%m-%d").log; fi'


VISUAL=vim
EDITOR="$VISUAL"
LESS="FRX"
RI="--format ansi -T"

export VISUAL EDITOR LESS RI


# TODO: make sure exists
export CC=/usr/local/bin/gcc-4.2


if type -p "brew" &> /dev/null && [ -f `brew --prefix`/etc/bash_completion.d ]; then
    . `brew --prefix`/etc/bash_completion.d
fi
export NVM_DIR=~/.nvm
# source /usr/local/opt/nvm/nvm.sh
complete -C '/usr/local/bin/aws_completer' aws

if type -p "tmux" &> /dev/null; then
  printf "\n -----\ntmux sessions \n -----\n"
  tmux ls
  printf " -----\n"
fi
# Path to the bash it configuration
export BASH_IT="/Users/evan.miller/.bash_it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='emiller'      # Modified from 'atiomic'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Load Bash It
source "$BASH_IT"/bash_it.sh
eval "$(direnv hook bash)"

# Setting PATH for Python 3.10
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.10/bin:${PATH}"
export PATH
