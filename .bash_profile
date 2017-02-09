source "$HOME/.bash_functions"
source "$HOME/.bash_aliases"


# Could be changed to use .bashrc 
[ ! -f "$HOME/.bash_profile.local" ] || . "$HOME/.bash_profile.local"

# Prompt with current path
#PS1='[\u@\h \w]\\$ '
[ -z "$PS1" ] || export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$(parse_git_branch)$ "

# TODO: ensure path exists
PATH=/usr/local/bin:$PATH
PATH=$PATH:$HOME/bin             # Add my bin to the PATH
PATH=$PATH:$HOME/.rvm/bin        # Add RVM to PATH for scripting
export PATH

# TODO: ensure .rvm exists
# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Colors for iTerm. comment/uncomment for system
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# TODO: make platform-based
alias subl='open -a /Applications/Sublime\ Text\ 2.app/Contents/MacOS/Sublime\ Text\ 2'

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


# TODO: ensure present
# Whitenoise generation
alias brownnoise='play -qn -t sl -r48000 -c2 - synth -1 brownnoise tremolo .1 20 <  /dev/zero &'
alias pinknoise='play -qn -t sl -r48000 -c2 - synth -1 pinknoise tremolo .1 30 <  /dev/zero &'
alias whitenoise='play -qn -t sl -r48000 -c2 - synth -1 whitenoise tremolo .1 40 <  /dev/zero &'
alias noises='play --no-show-progress -c 2 --null synth brownnoise band -n 2 300 tremolo .1 20 reverb 10 bass -10 treble -1 vol 10dB < /dev/zero & play --no-show-progress -c 2 --null synth brownnoise band -n 2 300 tremolo .1 20 reverb 10 bass -10 treble -1 vol 10dB < /dev/zero & play --no-show-progress -c 2 --null synth brownnoise band -n 2 300 tremolo .1 20 reverb 10 bass -10 treble -1 vol 10dB < /dev/zero & play --no-show-progress -c 2 --null synth brownnoise band -n 2 300 tremolo .1 20 reverb 10 bass -10 treble -1 vol 10dB < /dev/zero &'

alias grep='grep --color=auto'

# TODO: make sure exists
export CC=/usr/local/bin/gcc-4.2


if type -p "brew" &> /dev/null && [ -f `brew --prefix`/etc/bash_completion.d ]; then
    . `brew --prefix`/etc/bash_completion.d
fi

source ~/.git-completion.bash

if type -p "tmux" &> /dev/null; then
  printf "\n -----\ntmux sessions \n -----\n"
  tmux ls
  printf " -----\n"
fi
