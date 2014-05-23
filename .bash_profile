if [ -f ~/.aliases ]; then
    . ~/.aliases
fi
#.bashrc中で.aliasesの設定と重複の場合に、.bashrcを優先するために、設定を.aliasesの下に移動
if [ -f ~/.bashrc ] ; then
    . ~/.bashrc
fi

export PATH="/usr/local/bin:$PATH:/usr/local/sbin"
export PATH=$PATH:~/bin

#eval "$(rbenv init -)"

alias javac='javac -J-Dfile.encoding=UTF-8'
alias java='java -Dfile.encoding=UTF-8'


# REGRESSION_NEXLINK
export REGRESSION_NEXLINK_HOME=$HOME/projects/regression_nexlink
export REGRESSION_NEXLINK_DOWNLOAD_DIR=$HOME/Downloads
