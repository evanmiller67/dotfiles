# ~/.bash_functions

[ ! -f "$HOME/.bash_functions.local" ] || . "$HOME/.bash_functions.local"

function ag_skipping_tests {
  ag "$@" app/ config/ lib/
}
