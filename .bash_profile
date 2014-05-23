if [ -f ~/.aliases ]; then
    . ~/.aliases
fi
#.bashrc$BCf$G(B.aliases$B$N@_Dj$H=EJ#$N>l9g$K!"(B.bashrc$B$rM%@h$9$k$?$a$K!"@_Dj$r(B.aliases$B$N2<$K0\F0(B
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
