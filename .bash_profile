# Prompt with current path
PS1='[\u@\h \w]\\$ '

# RVM
[[ -s "/Users/milleem1/.rvm/scripts/rvm" ]] && source "/Users/milleem1/.rvm/scripts/rvm"

# Colors for iTerm. comment/uncomment for system
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

PATH=/usr/local/bin:$PATH
export PATH

export P4CONFIG=/Users/milleem1/.p4settings
alias subl='open -a /Applications/Sublime\ Text\ 2.app/Contents/MacOS/Sublime\ Text\ 2'

# History syncing
export HISTSIZE=1000
export HISTCONTROL=erasedups
shopt -s histappend
export PROMPT_COMMAND="history -a; history -n"

# Use vi because fuck emacs
export EDITOR=vi

# Whitenoise generation
alias brownnoise='play -qn -t sl -r48000 -c2 - synth -1 brownnoise tremolo .1 20 <  /dev/zero &'
alias pinknoise='play -qn -t sl -r48000 -c2 - synth -1 pinknoise tremolo .1 30 <  /dev/zero &'
alias whitenoise='play -qn -t sl -r48000 -c2 - synth -1 whitenoise tremolo .1 40 <  /dev/zero &'
alias noises='play -qn -t sl -r48000 -c2 - synth -1 brownnoise tremolo .1 20 gain -25 < /dev/zero & play -qn -t sl -r48000 -c2 - synth -1 pinknoise tremolo .1 12 gain -30 < /dev/zero &'
