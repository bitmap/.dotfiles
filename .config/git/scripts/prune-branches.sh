#!/bin/bash

BRANCH="${1:-main}"
git branch -d $(git branch --merged=$BRANCH | grep -v $BRANCH)
git fetch --prune
