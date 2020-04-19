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

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 BRANCH_NAME"
    exit 1
fi

current=$(git branch | grep "*" | sed "s/* //")
echo -e "current branch: $red$current$NC"
if [[ $current == "$1" ]]; then
    print "$1" "already at $1 branch, fetching from remote.."
    git pull
else
    checkStatus
    print "$current" "switching to $1 branch"
    res="$(git checkout $1 2>&1)"
    checkCheckoutResult "$res"
    print "$1" "pulling from remote.."
    git pull
    print "$1" "switching back to $current"
    res="$(git checkout ${current} 2>&1)"
    checkCheckoutResult "$res"
    print "$current" "rebasing $1.."
    res="$(git rebase $1)"
    print "$current" "$res"
fi


