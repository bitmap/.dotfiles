#!/bin/zsh

BRANCH=$(git rev-parse --abbrev-ref HEAD)
REMOTE="${1:-origin}"

print -P "Pushing branch %F{5}$BRANCH%f to remote %F{4}$REMOTE%f"
git push -u $REMOTE $BRANCH
