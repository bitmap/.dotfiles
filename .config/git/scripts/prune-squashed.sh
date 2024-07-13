#!/bin/bash

BASE_BRANCH="${1:-main}"

git checkout -q $BASE_BRANCH && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base $BASE_BRANCH $branch) && [[ $(git cherry $BASE_BRANCH $(git commit-tree $(git rev-parse "$branch^{tree}") -p $mergeBase -m _)) == "-"* ]] && git branch -D $branch; done
