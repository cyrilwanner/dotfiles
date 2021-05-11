#!/bin/bash

# enable git commit signing globally
git config --global commit.gpgsign true

# set pull strategy
git config --global pull.rebase false

# set committer name and email
if [ ! $(git config --global user.email) ]; then
    git config --global user.email "info@cyr.li"
    git config --global user.name "Cyril Wanner"
fi
