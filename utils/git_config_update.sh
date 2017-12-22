#!/bin/bash

cd ~/src

for DIR in `find . -type d -maxdepth 1 | tail -n +3`; do
  echo =================================== DIR: $DIR
  pushd .
  find $DIR -name "config" | grep .git/config | xargs sed -i '' 's/dev\.changehealthcare\.com:2222/dev.changehealthcare.com/g'
  cd $DIR
  git pull
  popd
done
