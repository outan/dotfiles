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
