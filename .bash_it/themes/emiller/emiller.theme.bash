#!/usr/bin/env bash

# Axin Bash Prompt, inspired by theme "Sexy" and "Bobby"
# thanks to them

if tput setaf 1 &> /dev/null; then
    if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
      MAGENTA=$(tput setaf 9)
      #ORANGE=$(tput setaf 172)
      ORANGE=$(tput setaf 178)
      GREEN=$(tput setaf 190)
      GREEN=$(tput setaf 12)
      PURPLE=$(tput setaf 141)
      WHITE=$(tput setaf 0)
      LAVENDAR=$(tput setaf 12)
      BLUE=$(tput setaf 9)
    else
      MAGENTA=$(tput setaf 5)
      ORANGE=$(tput setaf 4)
      GREEN=$(tput setaf 2)
      PURPLE=$(tput setaf 1)
      WHITE=$(tput setaf 7)
      LAVENDAR=$(tput setaf 12)
      BLUE=$(tput setaf 2)
    fi
    BOLD=$(tput bold)
    RESET=$(tput sgr0)
else
    MAGENTA="\033[1;31m"
    ORANGE="\033[1;33m"
    GREEN="\033[1;32m"
    PURPLE="\033[1;35m"
    WHITE="\033[1;37m"
    BLUE="\033[1;34m"
    BOLD=""
    RESET="\033[m"
fi

function prompt_command() {
  #LEFT="\[${BOLD}${MAGENTA}\]\u \[$WHITE\]@ \[$ORANGE\]\h \[$WHITE\]in \[$GREEN\]\w \[$WHITE\]\[$PURPLE\]$(scm_prompt_info)"
  if [ $USER == 'root' ]; then 
    BLUE=$(tput setaf 160)
  fi
  LEFT="\[${BOLD}${BLUE}\]\u \[$WHITE\]@ \[$ORANGE\]\h \[$WHITE\]in \[$GREEN\]\w \[$WHITE\]\[$PURPLE\]$(scm_prompt_info)"
  BOTTOM="\$ \[$RESET\]"
  PS1="${LEFT} ${BOTTOM}"
}

THEME_CLOCK_COLOR=${THEME_CLOCK_COLOR:-"${white}"}

safe_append_prompt_command prompt_command
