if [ -f ~/.bash_git ]; then
    source ~/.bash_git
fi

if [ -f ~/.bash_android ]; then
    source ~/.bash_android
fi

#PS1='\W \$ '
PS1="\u@\[\e[0;32m\]\W\[\e[m\]\$ "