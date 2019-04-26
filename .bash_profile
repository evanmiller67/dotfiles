source "$HOME/.bash_functions"
source "$HOME/.bash_aliases"

# Could be changed to use .bashrc 
[ ! -f "$HOME/.bash_profile.local" ] || . "$HOME/.bash_profile.local"

# Prompt with current path
# [ -z "$PS1" ] || export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$ "

PATH=$PATH:$HOME/bin             # Add my bin to the PATH
export PATH

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Store 10,000 history entries
export HISTSIZE=10000
# Don't store duplicates
export HISTCONTROL=erasedups
# Append to history file
shopt -s histappend

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

if type -p "tmux" &> /dev/null; then
  printf "\n -----\ntmux sessions \n -----\n"
  tmux ls
  printf " -----\n"
fi
# Path to the bash it configuration
export BASH_IT="/Users/exm5840/.bash_it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
# export BASH_IT_THEME='axin'      # Modified from 'atiomic'
export BASH_IT_THEME='emiller'      # Modified from 'atiomic'
#export BASH_IT_THEME='sexy'
#export BASH_IT_THEME='atomic'    # Yellow/Green
#export BASH_IT_THEME='pure'      # Green/Blue
#export BASH_IT_THEME='rana'      # Green/Blue

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'
export GITHUB_TOKEN=4b6c9970434a4efb1af2f522f2f66058d3582ebd

# Don't check mail when opening terminal.
unset MAILCHECK

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Load Bash It
source "$BASH_IT"/bash_it.sh
