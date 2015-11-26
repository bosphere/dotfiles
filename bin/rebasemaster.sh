#!/bin/bash
red='\x1b[0;31m'
NC='\x1b[0m'

checkStatus() {
    status="$(git status)"
    if [[ $status =~ "working directory clean" ]]; then
        echo -e "[$red$current$NC] branch clean"
    else
        echo -e "[$red$current$NC] branch dirty, aborting.."
        exit 1
    fi
}

checkCheckoutResult() {
    if [[ ! $1 =~ "Switched to branch" ]]; then
        echo "failed to checkout branch, aborting.."
        exit 1
    fi
}

print() {
    echo -e "[${red}$1${NC}] $2"
}

current=$(git branch | grep "*" | sed "s/* //")
echo -e "current branch: $red$current$NC"
if [[ $current == "master" ]]; then
    print "master" "already at master branch, fetching from remote.."
    git pull
else
    checkStatus
    print "$current" "switching to master branch"
    res="$(git checkout master 2>&1)"
    checkCheckoutResult "$res"
    print "master" "pulling from remote.."
    git pull
    print "master" "switching back to $current"
    res="$(git checkout ${current} 2>&1)"
    checkCheckoutResult "$res"
    print "$current" "rebasing master.."
    res="$(git rebase master)"
    print "$current" "$res"
fi


