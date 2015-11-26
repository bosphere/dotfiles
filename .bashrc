if [ -f ~/.bash_git ]; then
    source ~/.bash_git
fi

if [ -f ~/.bash_android ]; then
    source ~/.bash_android
fi

#PS1='\W \$ '
PS1="\u@\[\e[0;32m\]\W\[\e[m\]\$ "

alias git="/usr/local/git/bin/git"
alias dev="cd ~/workspace/android/garena/RumaTalk/"
alias subl="/Applications/Sublime\ Text.app/Contents/MacOS/Sublime\ Text -w"
