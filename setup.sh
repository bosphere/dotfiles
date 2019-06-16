#!/bin/bash
set -e

CUR_DIR=`dirname $0`

function safecopy {
    local FILE=`basename "$1"`
    local OUTPUT_DIR=$2

    if [[ ! -d "$OUTPUT_DIR" ]]; then
        mkdir "$OUTPUT_DIR" || exit 1
    fi
    
    if [[ -e "$OUTPUT_DIR/$FILE" ]]; then
        echo "$OUTPUT_DIR/$FILE already exists, auto setup not possible"
        exit 1
    fi

    cp "$CUR_DIR/$1" "$OUTPUT_DIR/$FILE"
}

safecopy .vimrc ~

safecopy bin/config_upstream.sh ~/bin
safecopy bin/rebasemaster.sh ~/bin

safecopy .git-completion.bash ~
safecopy .bash_git ~

safecopy .bash_android ~

safecopy .bash_mac ~

safecopy .bashrc ~
safecopy .bash_profile ~
