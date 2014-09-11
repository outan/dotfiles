# update the Homebrew tool and get the all formulaes (including casks)
update

# upgrade any already-installed formulae(including homebrew cask tool)
upgrade

# Add repositories
tap homebrew/versions # install multiple versions of existing packages.
tap caskroom/cask
tap caskroom/versions # can install alternate versions of Casks.
tap homebrew/apache # for apache(httpd)

install brew-cask #pull down the latest Casks when use the regular Homebrew command brew update
install 'coreutils' # Install GNU core utilities (those that come with OS X are outdated) to use these commands without a prefix g ,you shoud add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."

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

#node version manager
install nvm

# uninstall unused and old versions of packages from the cellar
cleanup
