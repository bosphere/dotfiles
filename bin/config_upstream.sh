#!/bin/bash
red='\x1b[0;31m'
NC='\x1b[0m'

current=$(git branch | grep "*" | sed "s/* //")
echo -e "current branch: $red$current$NC"
git branch --set-upstream-to=origin/$current $current

