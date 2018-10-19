LANG=ja_JP.UTF-8
export EDITOR=vim

# antigenを導入
if [ -f ~/.antigen/antigen.zsh ] && [ -f ~/.zshrc.antigen ]; then
    source ~/.zshrc.antigen
fi


# historyに関する設定
HISTFILE=$HOME/.zsh-history
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_dups     # 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_all_dups # ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt share_history        # historyを複数タブ間で共有
setopt extended_history     # zshの開始, 終了時刻をhistoryファイルに書き込む
setopt hist_ignore_space    # スペースで始まるコマンド行はヒストリリストから削除
setopt hist_reduce_blanks   # 余分なスペースを削除してヒストリに保存する
setopt hist_expand          # 補完時にヒストリを自動的に展開する。
setopt hist_verify          # ヒストリを呼び出してから実行する間に一旦編集可能

#ls色付け
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export ZLS_COLORS=$LS_COLORS
export CLICOLOR=true

#zsh-completions (非標準コマンドを補完できる) 補完情報一覧:/usr/local/share/zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath) # for MAC Homebrew
fpath=(/home/nexlink/.linuxbrew/share/zsh-completions $fpath) # for Linux linuxbrew

## 補完機能を有効にする
autoload -U compinit #compinitのシェル関数を読み込む。-U:展開される関数の内部でaliasの展開をしない
compinit -C #補完機能を起動する。-C:security checkを飛ばして,zshの起速度をupする

## 補完候補のカーソル選択を有効に
zstyle ':completion:*:default' menu select=2

#先方予測機能を有効に設定
#autoload predict-on
#predict-on

# 補完侯補をhjklで動き回る
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

## 補完実行時に補完候補リストを表示する。(デフォルトで有効)
setopt auto_list

## TAB で順に補完候補を切り替える(デフォルトで有効)
setopt auto_menu

## 補完候補一覧でファイルの種別をマーク表示
setopt list_types

#補完候補を詰めて表示する設定
setopt list_packed

## recognize exact matches even if they are ambiguous(曖昧さがあっても正確なマッチを認識する)
setopt rec_exact

## カッコの対応などを自動的に補完
setopt auto_param_keys

## ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash

## =以降も補完する(--prefix=/usrなど)
setopt magic_equal_subst

## ディレクトリ名だけでcd移動できる
setopt auto_cd

# cdの履歴保存,"cd -[タブ]"で、これまでに移動したディレクトリ一覧が表示
setopt auto_pushd

## 同じディレクトリを pushd しない
setopt pushd_ignore_dups

## コアダンプサイズを制限
limit coredumpsize 102400

## 出力の文字列末尾に改行コードが無い場合でも表示
unsetopt promptcr

## 色を使う
setopt prompt_subst

## ビープを鳴らさない
setopt nobeep

## 内部コマンド jobs の出力をデフォルトで jobs -l にする
setopt long_list_jobs

## サスペンド中のプロセスと同じコマンド名を実行した場合はリジューム
setopt auto_resume

## ファイル名で #, ~, ^ の 3 文字を正規表現として扱う
setopt extended_glob

## =command を command のパス名に展開する
setopt equals

# ファイル名の展開で辞書順ではなく数値的にソート
setopt numeric_glob_sort

## 出力時8ビットを通す
setopt print_eight_bit

setopt correct     # コマンドのスペルを訂正してくれる
#setopt correct_all # コマンドだけではなく、対象となるファイルのスペルも訂正してくれる
#correct_all considered harmful http://bewatermyfriend.org/p/2012/00c/

# バックグラウンドジョブの状態変化を即時報告する
setopt notify

## 補完候補として表示されるファイルやディレクトリにもlsと同じカラーを設定する
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
## 補完候補がグループ別にメニュー表示
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:messages' format '%F{blue}%d'$DEFAULT
zstyle ':completion:*:warnings' format '%F{red}No matches found in:%B%b%f''%F{white}%d'$DEFAULT
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'$DEFAULT

#大文字を入力する場合は小文字を補完せずに、小文字を入力する場合は大文字を補完できるように
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# manの補完をセクション番号別に表示させる
zstyle ':completion:*:manuals' separate-sections true

# オブジェクトファイルや中間ファイルなどはfileとして補完させない
#zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#' '*?.swp'

# 自動補完時のseparatorを設定する
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true

autoload -U colors; colors
autoload -Uz vcs_info

local HOSTNAME_COLOR=$'%{\e[38;5;190m%}'
local USERNAME_COLOR=$'%{\e[38;5;199m%}'
local PATH_COLOR=$'%{\e[38;5;61m%}'
local RUBY_COLOR=$'%{\e[38;5;31m%}'
local VCS_COLOR=$'%{\e[38;5;248m%}'

zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b] (%a)'

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' unstagedstr '¹'  # display ¹ if there are unstaged changes
zstyle ':vcs_info:git:*' stagedstr '²'    # display ² if there are staged changes
zstyle ':vcs_info:git:*' formats '[%b]%c%u'
zstyle ':vcs_info:git:*' actionformats '[%b|%a]%c%u'

function ruby_prompt {
    if which rbenv > /dev/null; then
        result=`rbenv version | sed -e 's/ .*//'`
        if [ "$result" ] ; then
            echo "ruby:[$result]"
        fi
    fi
}

function git_stash_count {
    result=`git stash list 2>/dev/null | wc -l | tr -d ' '`
    if [ "$result" != 0 ] ; then
        echo " stash:$result"
    fi
}


RUBY_INFO=$'%{$RUBY_COLOR%}$(ruby_prompt)%{${reset_color}%}'
# RPROMPT="${RUBY_INFO}%{${reset_color}%}"
PROMPT=$'%{$fg[yellow]%}%n%{$fg[red]%}@$fg[green]%}%m %{$fg[cyan]%}%~ %1(v|%F{green}%1v%f|)$(git_stash_count)\n%{$fg[green]%}%#%{$reset_color%}'
# http://www.machu.jp/diary/20040329.html#p01
# プロンプトを’[user@hostname] $’の形式で表示 一般ユーザは$でrootは#にする
# プロンプトに色を付ける
#local GREEN=$'%{\e[1;32m%}'
#local BLUE=$'%{\e[1;34m%}'
#local DEFAULT=$'%{\e[1;m%}'
#PROMPT=$BLUE'[${USER}@${HOSTNAME}] %(!.#.$) '$DEFAULT
#RPROMPT=$GREEN'[%~]'$DEFAULT
#setopt PROMPT_SUBST

# aliasesファイルを有効にする
#source ~/.aliases
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

#cdの時に,自動的にlsalを実行し、current directoryをtitle barに動的に表示させる
#lsalを実行できるために、先に.aliasesファイルをロードする必要がある。
function chpwd() {
    lsal
    echo -n "\e]2;$(pwd)\a"
}

# cdとmkdirを一緒にする(defaultのmkdirコマンドを上書きすると他のスクリプトなどの中にmkdirを呼び出す時に予期せぬエラーが発生する可能性があるため、mkdir_cdという名前にしました。)
# http://d.hatena.ne.jp/yarb/20110126/p1
function mkdir_cd() {
if [ -d $1 ]; then
    echo "It already exsits! Cd to the directory."
    cd $1
elif [ -f /bin/mkdir ]; then
    echo "Created the directory and cd to it."
    /bin/mkdir -p $1 && cd $1
else
    echo "There's no mkdir in this systerm."
fi
}

# rbenv
if [ -d "$HOME/.rbenv/bin" ]; then # for CentOS: rbenvは~/.rbenv/binにインストールされるので、rbenvのコマンドの場所をPATHに追加しないとrbenvのコマンドが使えない。
    export PATH="$HOME/.rbenv/bin:$PATH"
#else
#    export RBENV_ROOT="/usr/local/var/rbenv" # for MAC: to use Homebrew's directories rather than ~/.rbenv
#    if [ -d $RBENV_ROOT ]; then
#        export PATH="$RBENV_ROOT/bin:$PATH"
#    fi
fi

# To enable shims(rbenv rehash) , autocompletion, add the path of shims to PATH
if which rbenv > /dev/null; then
    eval "$(rbenv init - zsh)";
fi

## http://d.hatena.ne.jp/hiboma/20120315/1331821642
## Ctrl + X Crtl + Pでコマンドラインをクリップボードに登録
pbcopy-buffer() {
    print -rn $BUFFER | pbcopy
    zle -M "pbcopy: ${BUFFER}"
}
zle -N pbcopy-buffer
bindkey '^x^p' pbcopy-buffer

# bindkey
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
bindkey '^X^F' forward-word
bindkey '^X^B' backward-word
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward

bindkey "^A" beginning-of-line
bindkey "^B" backward-char
bindkey "^E" end-of-line
bindkey "^F" forward-char
bindkey "^G" send-break
bindkey "^H" backward-delete-char
bindkey "^I" expand-or-complete
bindkey "^L" clear-screen
bindkey "^M" accept-line
bindkey "^N" down-line-or-history
bindkey "^P" up-line-or-history
bindkey "^R" history-incremental-search-backward
bindkey "^U" kill-whole-line
bindkey "^W" backward-kill-word

# コマンド実行に3秒以上かかった時にtimeコマンドと同じように処理時間を出してくれる
REPORTTIME=3

#use vm to show less command
#alias less='/usr/share/vim/vim73/macros/less.sh'

# less行番号を表示させる
alias less="less -N"

# less のステータス行にファイル名と行数、いま何%かを表示
export LESS='-X -i -P ?f%f:(stdin). ?lb%lb?L/%L.. [?eEOF:?pb%pb\%..]'

#conflicts with the zsh globbing問題を解決する。 https://blog.afoolishmanifesto.com/posts/git-aliases-for-your-life/
alias git='noglob git'

# REGRESSION_NEXLINK
export REGRESSION_NEXLINK_HOME=$HOME/projects/regression_nexlink
export REGRESSION_NEXLINK_DOWNLOAD_DIR=$HOME/Downloads

#perlの設定
if which plenv > /dev/null; then
    export PLENV_ROOT="$HOME/.plenv"
    export PATH=$PLENV_ROOT/shims:$PATH
    eval "$(plenv init - zsh)";
fi

#pythonの設定
if which pyenv > /dev/null; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH=$PYENV_ROOT/shims:$PATH
    eval "$(pyenv init - zsh)";
fi
#export PYTHONPATH="$HOME/Dropbox/Library/pepper/pynaoqi-python2.7-2.4.2.26-mac64"
#export DYLD_LIBRARY_PATH="${DYLD_LIBRARY_PATH}:$HOME/Dropbox/Library/pepper/pynaoqi-python2.7-2.4.2.26-mac64"
export PATH="$HOME/.rbenv/bin:$PATH"

#phpの設定
if [ -d ~/.phpenv/bin ]; then
    export PHPENV_ROOT="$HOME/.phpenv"
    export PATH=$PHPENV_ROOT/bin:$PATH
    eval "$(phpenv init - zsh)";
fi

#anyenv(phpenv,rbenv,plenv,pyenvなどのwrapper)
if [ -d ~/.anyenv/bin ]; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init - zsh)"
fi


#nexlink1.0ローカル開発環境でどこでもcli.phpのコマンドを実行できるようにパスを追加
if [ -d ~/system/nexlink-b/app/bin ]; then
    export PATH=~/system/nexlink-b/app/bin:$PATH
fi

#vimの一時ファイルを削除する関数
rmtemp() {
if [ -f /usr/local/bin/trash ]
then
    case "$1" in
        "--dry-run" | "-n")
        find . \( -name "*~" -o -name ".DS_Store" -o -name "*.swp" -o -name "*.bak"  \( -type f -or -type l \) \) -maxdepth 1
        ;;
    "~" | "DS_Store" | "swp" | "bak")
        find . -name "*$1" \( -type f -or -type l \) -maxdepth 1 -exec  /usr/local/bin/trash -fv -- {} +
        ;;
    "")
        find . \( -name "*~" -o -name ".DS_Store" -o -name "*.swp" -o -name "*.bak"  \( -type f -or -type l \) \) -maxdepth 1 -exec  /usr/local/bin/trash -fv -- {} +
        ;;
    *)
        echo "Unsupported option \`$1'.\nDid you mean --dry-run?(using command trash)"
        ;;
    esac
elif [ -f /usr/local/bin/rmtrash ]
then
    case "$1" in
    "--dry-run" | "-n")
        find . \( -name "*~" -o -name ".DS_Store" -o -name "*.swp" -o -name "*.bak" \( -type f -or -type l \) \) -maxdepth 1
        ;;
    "~" | "DS_Store" | "swp" | "bak")
        find . -name "*$1" \( -type f -or -type l \) -maxdepth 1 -exec  /usr/local/bin/rmtrash -fv -- {} +
        ;;
    "")
        find . \( -name "*~" -o -name ".DS_Store" -o -name "*.swp" -o -name "*.bak" \( -type f -or -type l \) \) -maxdepth 1 -exec  /usr/local/bin/rmtrash  -- {} +
        ;;
    *)
        echo "Unsupported option \`$1'.\nDid you mean --dry-run? (using command rmtrash)"
        ;;
    esac
else
    case "$1" in
    "--dry-run" | "-n")
        find . \( -name "*~" -o -name ".DS_Store" -o -name "*.swp" -o -name "*.bak" \( -type f -or -type l \) \) -maxdepth 1
        ;;
    "~" | "DS_Store" | "swp" | "bak")
        find . -name "*$1" \( -type f -or -type l \) -maxdepth 1 -exec /bin/rm  -fv -- {} +
        ;;
    "")
        find . \( -name "*~" -o -name ".DS_Store" -o -name "*.swp" -o -name "*.bak" \( -type f -or -type l \) \) -maxdepth 1 -exec  /bin/rm   -- {} +
        ;;
    *)
        echo "Unsupported option \`$1'.\nDid you mean --dry-run? (using OS default command rm)"
        ;;
    esac
fi
}

#子ディレクトリも削除しに行く。
rmtempall() {
if [ -f /usr/local/bin/trash ]
then
    case "$1" in
        "--dry-run" | "-n")
        find . -type d -name ".Trash" -prune -o \( -name "*~" -o -name ".DS_Store" -o -name "*.swp" -o -name "*.bak" \( -type f -or -type l \) \)
        ;;
    "~" | "DS_Store" | "swp" | "bak")
        find . -type d -name ".Trash" -prune -o -name "*$1" \( -type f -or -type l \) -exec  /usr/local/bin/trash -fv -- {} +
        ;;
    "")
        find . -type d -name ".Trash" -prune -o \( -name "*~" -o -name ".DS_Store" -o -name "*.swp" -o -name "*.bak" \( -type f -or -type l \) \) -exec  /usr/local/bin/trash -fv -- {} +
        ;;
    *)
        echo "Unsupported option \`$1'.\nDid you mean --dry-run?(using command trash)"
        ;;
    esac
elif [ -f /usr/local/bin/rmtrash ]
then
    case "$1" in
    "--dry-run" | "-n")
        find . -type d -name ".Trash" -prune -o \( -name "*~" -o -name ".DS_Store" -o -name "*.swp" -o -name "*.bak" \( -type f -or -type l \) \)         ;;
    "~" | "DS_Store" | "swp" | "bak")
        find . -type d -name ".Trash" -prune -o -name "*$1" \( -type f -or -type l \) -exec  /usr/local/bin/rmtrash -fv -- {} +
        ;;
    "")
        find . -type d -name ".Trash" -prune -o \( -name "*~" -o -name ".DS_Store" -o -name "*.swp" -o -name "*.bak" \( -type f -or -type l \) \) -exec  /usr/local/bin/trash  -- {} +
        ;;
    *)
        echo "Unsupported option \`$1'.\nDid you mean --dry-run? (using command rmtrash)"
        ;;
    esac
else
    case "$1" in
    "--dry-run" | "-n")
        find . -type d -name ".Trash" -prune -o \( -name "*~" -o -name ".DS_Store" -o -name "*.swp" -o -name "*.bak" \( -type f -or -type l \) \)
        ;;
    "~" | "DS_Store" | "swp" | "bak")
        find . -type d -name ".Trash" -prune -o -name "*$1" \( -type f -or -type l \) -exec /bin/rm  -fv -- {} +
        ;;
    "")
        find . -type d -name ".Trash" -prune -o \( -name "*~" -o -name ".DS_Store" -o -name "*.swp" -o -name "*bak" \( -type f -or -type l \) \) -exec  /bin/rm   -- {} +
        ;;
    *)
        echo "Unsupported option \`$1'.\nDid you mean --dry-run? (using OS default command rm)"
        ;;
    esac
fi
}

# vimの一時ファイル保存ディレクトリを指定
if [ ! -d ~/.vim/tmp ]; then
    mkdir -p ~/.vim/tmp
fi

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# terminalのタブ名を変更する関数
function title {
    # カレントディレクトリを $HOME を ~ として表示
    local wname=`pwd | sed -e "s|$HOME|~|"`
    # カレントディレクトリ名
    local tname=`pwd | sed -e 's|^.*/||'`

    echo -ne "\033]2;$wname\007" # window title
    echo -ne "\033]1;$tname\007" # tab title
}

#ログイン時に自動的にtmuxを起動、セッションがある場合はアタッチするようになります。
#if [ -z "$ps1" ]; then return ; fi

#if [ -z $tmux ] ; then
#    if [ -z `tmux ls` ] ; then
#        tmux
#    else
#        tmux attach
#    fi
#fi

#auto-fu.zsh
#http://blog.glidenote.com/blog/2012/04/07/auto-fu.zsh/
if [ -f ~/dotfiles/auto-fu.pu.zsh ]; then
    source ~/dotfiles/auto-fu.pu.zsh
    function zle-line-init () {
        auto-fu-init
    }
    zle -N zle-line-init
    zstyle ':completion:*' completer _oldlist _complete
    zstyle ':auto-fu:var' postdisplay $'' #「-azhu-」を非表示にする
fi


#z.sh：最近移動したディレクトリの補完ができる(cdコマンド履歴のjump)
_Z_CMD=j
if which brew > /dev/null && [ -f `brew --prefix`/etc/profile.d/z.sh ]; then
    . `brew --prefix`/etc/profile.d/z.sh
elif [ -f ~/dotfiles/z.sh ]; then
    source ~/dotfiles/z.sh
fi

function precmd () {
    psvar=()
    vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
    _z --add "$(pwd -P)"
    echo -n "\e]2;$(pwd)\a"
}

# http://blog.glidenote.com/blog/2012/12/15/zsh-syntax-highlighting/
#source zsh-syntax-highlighting
if [ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif  [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# コマンドのmanを素早く見える
alias run-help >/dev/null 2>&1 && unalias run-help
autoload -Uz run-help
autoload -Uz run-help-git
autoload -Uz run-help-svn
HELPDIR=/usr/local/share/zsh/helpfiles

# brew caskのインストール先を変更する
export HOMEBREW_CASK_OPTS="--appdir=/Applications --caskroom=/usr/local/Caskroom"

# sublime textをコマンドラインから起動できるように設定
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
export PATH="/usr/local/Caskroom/sublime-text3/Build 3065/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
# node.jsのバージョン管理ソフトウェアの導入に関する設定
if which brew > /dev/null && [ -s $(brew --prefix nvm)/nvm.sh ]; then
    if [ ! -d ~/.nvm ]; then
        mkdir ~/.nvm
    fi
    export NVM_DIR=~/.nvm #move install location to prevent that node installs will be lost upon upgrading nvm
    source $(brew --prefix nvm)/nvm.sh
fi

# linuxbrew導入に関する設定
if [ -d "$HOME/.linuxbrew" ]; then
    export PATH="$HOME/.linuxbrew/bin:$PATH"
    export LD_LIBRARY_PATH="$HOME/.linuxbrew/lib:$LD_LIBRARY_PATH"
fi

# CentOSでdevtoolset導入に関する設定(新gccなどのツールをインストール)
if [ -f /opt/centos/devtoolset-1.1/enable ]; then
    source /opt/centos/devtoolset-1.1/enable
fi


###-begin-npm-completion-###
# npm command completion script
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _npm_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###

#コマンドラインスタック(buffer stack)はControl+qでも実行できるようにする
show_buffer_stack() {
  POSTDISPLAY="
stack: $LBUFFER"
  zle push-line-or-edit
}
zle -N show_buffer_stack
setopt noflowcontrol
bindkey '^Q' show_buffer_stack

#dockerに関する環境変数
if which docker > /dev/null && boot2docker 2> /dev/null; then
    export DOCKER_HOST=tcp://$(boot2docker ip 2>/dev/null):2376
    export DOCKER_CERT_PATH=~/.boot2docker/certs/boot2docker-vm/
    export DOCKER_TLS_VERIFY=1
fi

# php composerに関連する設定
if which composer > /dev/null; then
     export COMPOSER_ROOT="$HOME/.composer"
     export PATH=$COMPOSER_ROOT/vendor/bin:$PATH
fi

# enable awscli zsh completionw
if [ -f "/usr/local/share/zsh/site-functions/_aws" ]; then
    source /usr/local/share/zsh/site-functions/_aws
fi

# java home 設定
export JAVA_HOME="$(/usr/libexec/java_home)"

# ec2 api toolsとec2 ami toolsの導入設定
export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.7.4.0"
export PATH=$PATH:$EC2_HOME/bin

export EC2_AMITOOL_HOME="/usr/local/Cellar/ec2-ami-tools/1.5.7"
export PATH=$PATH:$EC2_AMITOOL_HOME/bin

export EC2_URL="ec2.ap-northeast-1.amazonaws.com" #tokyo reginのendpointを設定

# docker-machine env設定
# eval "$(docker-machine env b2d)" 2> /dev/null

#速度測定(zshenvでzprofモジュールを読み込んでおく必要がある。)
if (which zprof > /dev/null) ;then
    zprof | less
fi

# enhancd
if [ -f "~/.enhancd/zsh/enhancd.zsh" ]; then
    source "~/.enhancd/zsh/enhancd.zsh"
fi
export NODE_PATH=/Users/outanwang/.nvm/versions/node/v6.2.0/lib/node_modules

if which pyenv-virtualenv-init > /dev/null;then
    eval "$(pyenv virtualenv-init -)";
fi
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
