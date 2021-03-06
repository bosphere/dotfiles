#!/bin/zsh
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

function clone_or_pull {
    local REPO=$1
    local LOCAL_REPO=$2
    local LOCAL_REPO_GIT=$LOCAL_REPO/.git

    if [ ! -d $LOCAL_REPO_GIT ]; then
        git clone $REPO $LOCAL_REPO
    else
        pushd $LOCAL_REPO
        git pull $REPO
        popd
    fi
}

# install zsh-autosuggestions
echo "installing zsh-autosuggestions"
zsh_autosuggestions_repo="https://github.com/zsh-users/zsh-autosuggestions"
zsh_autosuggestions_dir=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
clone_or_pull $zsh_autosuggestions_repo $zsh_autosuggestions_dir

echo "sourcing config files in ~/.zshrc"
cur_dir=${0:a:h}
cat >> ~/.zshrc <<- END
for f in $cur_dir/source_*; do
    source \$f
done

# export to sub-processes
export PATH
END

echo "copying .vimrc"
safecopy .vimrc ~