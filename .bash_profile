# Prompt with current path
PS1='[\u@\h \w]\\$ '

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Colors for iTerm. comment/uncomment for system
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

PATH=/usr/local/bin:$PATH
export PATH

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
alias noises='play --no-show-progress -c 2 --null synth brownnoise band -n 2 300 tremolo .1 20 reverb 10 bass -10 treble -1 vol 10dB < /dev/zero & play --no-show-progress -c 2 --null synth brownnoise band -n 2 300 tremolo .1 20 reverb 10 bass -10 treble -1 vol 10dB < /dev/zero & play --no-show-progress -c 2 --null synth brownnoise band -n 2 300 tremolo .1 20 reverb 10 bass -10 treble -1 vol 10dB < /dev/zero & play --no-show-progress -c 2 --null synth brownnoise band -n 2 300 tremolo .1 20 reverb 10 bass -10 treble -1 vol 10dB < /dev/zero &'

alias grep='grep --color=auto'

export CC=/usr/bin/gcc-4.2
