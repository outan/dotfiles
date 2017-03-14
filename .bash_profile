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

export PATH="$HOME/.ndenv/bin:$PATH"
eval "$(ndenv init -)"
