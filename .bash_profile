if [ -f ~/.bashrc ] ; then
    . ~/.bashrc
fi

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

export PATH="/usr/local/bin:$PATH:/usr/local/sbin"
export PATH=$PATH:/Users/outan/bin
#source ~/.aliases

eval "$(rbenv init -)"

alias javac='javac -J-Dfile.encoding=UTF-8'
alias java='java -Dfile.encoding=UTF-8'
