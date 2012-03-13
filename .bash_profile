PS1='[\u@\h \w]\\$ '

[[ -s "/Users/milleem1/.rvm/scripts/rvm" ]] && source "/Users/milleem1/.rvm/scripts/rvm"

# Colors for iTerm. comment/uncomment for system
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

PATH=/usr/local/bin:$PATH
export PATH

export P4CONFIG=/Users/milleem1/.p4settings

alias brownnoise='play -qn -t sl -r48000 -c2 - synth -1 brownnoise tremolo .1 20 <  /dev/zero &'
alias pinknoise='play -qn -t sl -r48000 -c2 - synth -1 pinknoise tremolo .1 30 <  /dev/zero &'
alias whitenoise='play -qn -t sl -r48000 -c2 - synth -1 whitenoise tremolo .1 40 <  /dev/zero &'

alias noises='play -qn -t sl -r48000 -c2 - synth -1 brownnoise tremolo .1 20 gain -12 < /dev/zero &  play -qn -t sl -r48000 -c2 - synth -1 pinknoise tremolo .1 30 gain -12 < /dev/zero &'
