#!/bin/bash

#get current hash and see if it already has a tag
GIT_COMMIT=`git rev-parse HEAD`
NEEDS_TAG=`git describe --contains $GIT_COMMIT 2>/dev/null`
NEW_TAG=$1
NEW_MESSAGE=$2

#only tag if no tag already
if [ -z "$NEEDS_TAG" ]; then
    git tag -a $NEW_TAG -m $NEW_MESSAGE
    echo "Tagged with $NEW_TAG"
    git describe
else
    echo "Already a tag on this commit"
fi