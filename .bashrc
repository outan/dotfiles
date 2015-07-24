#promt設定
PS1="\[\e[1;32m\][\u@\h:\w]\$\[\e[00m\] "

# カラー設定
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;37;41'

if [ -f $HOME/.git-completion.bash ];then
	source $HOME/.git-completion.bash
fi

if [ -f $HOME/.git-prompt.sh ];then
	source $HOME/.git-prompt.sh
fi

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_UNTRACKEDFILES=true
#PROMPT_COMMAND="__git_ps1 '\u@\h:\w' '\\$ '"
#PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

export LESS='-R'

#use vm to show less command
#が、git logやgit diffなどはデフォルトでlessをpagerとして利用しているが、日本語がうまく表示できなくなったため、.gitconfig中でpagerをlvに変更済み。
alias less='/usr/share/vim/vim73/macros/less.sh'
# less のステータス行にファイル名と行数、いま何%かを表示
export LESS='-X -i -P ?f%f:(stdin). ?lb%lb?L/%L.. [?eEOF:?pb%pb\%..]'

# node.jsのバージョン管理ソフトウェアの導入に関する設定
if which brew > /dev/null && [[ -s $(brew --prefix nvm)/nvm.sh ]];then
    export NVM_DIR=~/.nvm #move install location to prevent that node installs will be lost upon upgrading nvm
    source $(brew --prefix nvm)/nvm.sh
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
