# make sure we’re using the latest Homebrew
update

# Upgrade any already-installed formulae
upgrade

# Add repositories
# install multiple versions of existing packages.
tap homebrew/versions
tap caskroom/cask
# can install alternate versions of Casks.
tap caskroom/versions
# for apache(httpd)
tap homebrew/apache

# Install GNU core utilities (those that come with OS X are outdated)
install 'coreutils'
#echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
install 'findutils'

# Install Bash 4
install 'bash'

# Install wget with IRI support
install 'wget'

install 'curl'

install 'tmux'

install 'zsh'

install 'rbenv'

install 'mysql'

install 'tree'

#make less command show color
install 'source-highlight'

install 'git'

#.gitconfig設定後、git log -pでは文字化けという現象の対処
install 'lv'

#gitのログを見やすくする
install 'tig'

#git branch管理用のツール
install 'git-flow'

install 'openssl'

#install 'curl-ca-bundle'
#opensslで必要なものだが、homebrewから何かの原因でremoveされたので、
#コメントしないとbrew bundle実行する時にエラーが発生する。
#https://github.com/Homebrew/homebrew/pull/28658

install 'ack'
install 'ag'
install 'hub'

install 'terminal-notifier'

install lsyncd

install redis

install rmtrash

#pythonのバージョン管理ツール
install pyenv

#perlのバージョン管理ツール
install plenv perl-build

#guess of the input kanji encodings
install nkf

#色付きのdiffコマンド(MACのデフォルトdiffコマンドは色表示できない。)
install colordiff

#同期用ツール
install unison

install z

install readline

install zsh-completions

install zsh-syntax-highlighting

install pstree

#topコマンドの高機能版
install htop

#javaScpritのサーバーサイド実行プラットフォームnode.js(package管理ツールnpmも一緒にインストールされる)
install node

#node version manager
install nvm

# uninstall unused and old versions of packages from the cellar
cleanup
