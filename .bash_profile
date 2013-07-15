source "$HOME/.bash_functions"

# Prompt with current path
#PS1='[\u@\h \w]\\$ '
[ -z "$PS1" ] || export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$(parse_git_branch)$ "

# TODO: ensure .rvm exists
# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Colors for iTerm. comment/uncomment for system
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# TODO: ensure path exists
PATH=/usr/local/bin:$PATH
export PATH

# TODO: make platform-based
alias subl='open -a /Applications/Sublime\ Text\ 2.app/Contents/MacOS/Sublime\ Text\ 2'

# History syncing
export HISTSIZE=1000
export HISTCONTROL=erasedups
shopt -s histappend
export PROMPT_COMMAND="history -a; history -n"

# There was any other choice? 
export EDITOR=vi

# TODO: ensure present
# Whitenoise generation
alias brownnoise='play -qn -t sl -r48000 -c2 - synth -1 brownnoise tremolo .1 20 <  /dev/zero &'
alias pinknoise='play -qn -t sl -r48000 -c2 - synth -1 pinknoise tremolo .1 30 <  /dev/zero &'
alias whitenoise='play -qn -t sl -r48000 -c2 - synth -1 whitenoise tremolo .1 40 <  /dev/zero &'
alias noises='play --no-show-progress -c 2 --null synth brownnoise band -n 2 300 tremolo .1 20 reverb 10 bass -10 treble -1 vol 10dB < /dev/zero & play --no-show-progress -c 2 --null synth brownnoise band -n 2 300 tremolo .1 20 reverb 10 bass -10 treble -1 vol 10dB < /dev/zero & play --no-show-progress -c 2 --null synth brownnoise band -n 2 300 tremolo .1 20 reverb 10 bass -10 treble -1 vol 10dB < /dev/zero & play --no-show-progress -c 2 --null synth brownnoise band -n 2 300 tremolo .1 20 reverb 10 bass -10 treble -1 vol 10dB < /dev/zero &'

alias grep='grep --color=auto'

# TODO: make sure exists
export CC=/usr/bin/gcc-4.2


git_completion='/usr/local/Cellar/git/1.8*/etc/bash_completion.d/git-completion.bash'

if [ -f $git_completion ]; then
  source $git_completion
fi
