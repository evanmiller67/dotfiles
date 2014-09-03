#!/bin/bash

pushd .;
cd ~/src
for i in $(ls -d */ | cut -f1 -d'/'); do 
  echo "====== Updating " $i
  cd $i; 
  CURRENT=$(git branch | grep '\*' | awk '{print $2}')
  for branch in $(git for-each-ref --format='%(refname:short)' refs/heads/); do
    git checkout $branch;
    git pull;
  done
  git checkout ${CURRENT};
  cd ..; 
done
popd;
