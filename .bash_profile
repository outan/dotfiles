if [ -f ~/.aliases ]; then
    . ~/.aliases
fi
#.bashrc中で.aliasesの設定と重複の場合に、.bashrcを優先するために、設定を.aliasesの下に移動
if [ -f ~/.bashrc ] ; then
    . ~/.bashrc
fi

export PATH="/usr/local/bin:$PATH:/usr/local/sbin"
export PATH=$PATH:~/bin
export PATH=$PATH:/sbin
export PATH=$PATH:/usr/sbin

## rbenv
if [ -d "$HOME/.rbenv/bin" ]; then # for CentOS: rbenvは~/.rbenv/binにインストールされるので、rbenvのコマンドの場所をPATHに追加しないとrbenvのコマンドが使えない。
    export PATH="$HOME/.rbenv/bin:$PATH"
fi

# To enable shims(rbenv rehash) , autocompletion, add the path of shims to PATH
if which rbenv > /dev/null; then
    eval "$(rbenv init - zsh)";
fi

alias javac='javac -J-Dfile.encoding=UTF-8'
alias java='java -Dfile.encoding=UTF-8'


# REGRESSION_NEXLINK
export REGRESSION_NEXLINK_HOME=$HOME/projects/regression_nexlink
export REGRESSION_NEXLINK_DOWNLOAD_DIR=$HOME/Downloads

# linuxbrew導入に関する設定
if [ -d "$HOME/.linuxbrew" ];then
    export PATH="$HOME/.linuxbrew/bin:$PATH"
    export LD_LIBRARY_PATH="$HOME/.linuxbrew/lib:$LD_LIBRARY_PATH"
fi

# CentOSでdevtoolset導入に関する設定(新gccなどのツールをインストール)
if [ /opt/centos/devtoolset-1.1/enable ];then
    source /opt/centos/devtoolset-1.1/enable
fi
