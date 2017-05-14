if [ -f ~/.aliases ]; then
    . ~/.aliases
fi
#.bashrc中で.aliasesの設定と重複の場合に、.bashrcを優先するために、設定を.aliasesの下に移動
if [ -f ~/.bashrc ] ; then
    . ~/.bashrc
fi

export PATH="/usr/bin:$PATH:/usr/sbin"
export PATH=$PATH:~/bin
export PATH=$PATH:/sbin
export PATH=$PATH:/bin
export PATH=$PATH:/usr/sbin
export PATH=~/.local/bin:$PATH

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

if [ -d "$HOME/.ndenv/bin" ];then
  export PATH="$HOME/.ndenv/bin:$PATH"
  eval "$(ndenv init -)"
fi

# mongodb
export PATH=$HOME/bin/mongodb-linux-i686-3.2.4/bin:$PATH
alias mongod='mongod --storageEngine=mmapv1 --dbpath /data/db/'
# REGRESSION_NEXLINK
export REGRESSION_NEXLINK_HOME=$HOME/projects/regression_nexlink
export REGRESSION_NEXLINK_DOWNLOAD_DIR=$HOME/Downloads

# linuxbrew導入に関する設定
if [ -d "$HOME/.linuxbrew" ];then
    export PATH="$HOME/.linuxbrew/bin:$PATH"
    export LD_LIBRARY_PATH="$HOME/.linuxbrew/lib:$LD_LIBRARY_PATH"
fi

# virtualenv and virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
if [ -f "/usr/local/bin/virtualenvwrapper.sh" ];then
   source /usr/local/bin/virtualenvwrapper.sh
fi
export NODE_PATH=/Users/outanwang/.nvm/versions/node/v6.2.0/lib/node_modules
