function parse_git_deleted {
  [[ $(git status 2> /dev/null | grep deleted:) != "" ]] && echo "-"
}
function parse_git_added {
  [[ $(git status 2> /dev/null | grep "Untracked files:") != "" ]] && echo '+'
}
function parse_git_modified {
  [[ $(git status 2> /dev/null | grep modified:) != "" ]] && echo "*"
}
function parse_git_dirty {
  echo "$(parse_git_added)$(parse_git_modified)$(parse_git_deleted)"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(parse_git_dirty))/"
}
function rubygc {
  #export RUBY_GC_MALLOC_LIMIT=9000000
  #export RUBY_FREE_MIN=20000
  export RUBY_GC_MALLOC_LIMIT=1000000000
  export RUBY_FREE_MIN=500000
  "$@"
  export RUBY_GC_MALLOC_LIMIT=
  export RUBY_FREE_MIN=
}
