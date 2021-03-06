# Add repositories
# install multiple versions of existing packages.
tap 'homebrew/cask-versions'

tap 'Homebrew/cask-fonts'

tap 'buo/cask-upgrade' #brew-cask-upgrade is an external command to replace the native upgrade

# Install GNU core utilities (those that come with OS X are outdated) to use these commands without a prefix g ,you shoud add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."
brew 'coreutils'

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew 'findutils'

# Install Bash 4
brew 'bash'

# Install wget with IRI support
brew 'wget'

brew 'curl'

brew 'tmux'

brew 'zsh'

#ruby-buildをインストールすることにより、rbenv installが利用できるようになる。rbenv自体はrubyをインストールできないから。
brew 'rbenv'
brew 'ruby-build'

brew 'mysql'

# MySQL等に関する便利なコマンドラインツールの集まり
#brew  percona-toolkit↲

#httpd 2.4.10
brew 'httpd24'

brew 'tree'

#make less command show color
brew 'source-highlight'

brew 'git'

#.gitconfig設定後、git log -pでは文字化けという現象の対処
brew 'lv'

#gitのログを見やすくする
brew 'tig'

#git branch管理用のツール
brew 'git-flow'

brew 'openssl'

#install 'curl-ca-bundle'
#opensslで必要なものだが、homebrewから何かの原因でremoveされたので、
#コメントしないとbrew bundle実行する時にエラーが発生する。
#https://github.com/Homebrew/homebrew/pull/28658

brew 'ack'
brew 'ag'
brew 'hub'

brew 'terminal-notifier'

brew 'lsyncd'

brew 'redis'

brew 'rmtrash'

#pythonのバージョン管理ツール
brew 'pyenv'

#perlのバージョン管理ツール
#brew 'plenv'
#brew 'perl-build'

#guess of the input kanji encodings
brew 'nkf'

#色付きのdiffコマンド(MACのデフォルトdiffコマンドは色表示できない。)
brew 'colordiff'

#同期用ツール
#brew 'unison'

brew 'z'

brew 'readline'

brew 'zsh-completions'

brew 'zsh-syntax-highlighting'

brew 'pstree'

#topコマンドの高機能版
brew 'htop'

#node version manager
brew 'nvm'

#trash
tap 'rcmdnk/rcmdnkpac'
brew 'rcmdnk-trash'

# 公開鍵をサーバーに登録する
brew 'ssh-copy-id'

# AWS Elastic Beanstalk EB Command Line Interface
brew 'awsebcli'

# AWS cli
brew 'awscli'

# thefuck(corrects previous console command)
brew 'thefuck'

# .gitignore自動生成
brew 'gibo'

brew 'zlib'

#Utility to make sentaku (selection, 選択(sentaku)) window with shell command.
tap 'rcmdnk/rcmdnkpac'
brew 'sentaku'

brew "vim", args: ["with-lua"]

brew 'mas' #command line for the Mac App Store. Designed for scripting and automation

brew 'mackup'

# web browsers
cask 'google-chrome'
cask 'firefox'

# dev tools
cask 'iterm2'
cask 'mysqlworkbench'
#cask 'virtualbox'
#cask 'vmware-fusion'
cask 'github'
#cask 'sourcetree'
#cask 'rubymine'
#cask 'vagrant'
#cask 'xquartz'
#cask 'unity-web-player'
#cask 'dash'

# editors
#cask 'sublime-text3'
#cask 'macvim-kaoriya'
#cask 'textwrangler'
cask 'atom'
#cask 'textmate'
#cask 'mou'

# additional apps
cask 'dropbox'
#cask 'evernote'
cask 'alfred'
#cask 'freemind'
#cask 'openoffice'
cask 'libreoffice'
#cask 'skype'

cask 'skitch'
cask 'adobe-acrobat-reader'
cask 'licecap' # gif animation capture
cask 'gyazo' #gyazo gifも自動的にインストールされる。
cask 'skim'
#cask 'xtrafinder' #System Integrity Protection needs be disabled to install XtraFinder
#cask 'magican'
cask 'google-japanese-ime'
cask 'sogouinput' #To complete the installation, you must also run the downloaded installer(/usr/local/Caskroom/sogouinput/)
cask 'appcleaner'
cask 'ccleaner'
cask 'cheatsheet'

# SNS
#cask 'wechat' #App Storeで管理
#cask 'qq'

# mac quick look plugin
#cask 'qlstephen'
#cask 'qlmarkdown'
#cask 'quicklook-json'
#cask 'quicklook-csv'
#cask 'betterzipql'
#cask 'suspicious-package'

# Command+Qの誤爆によるアプリ終了を防止
cask 'karabiner'

# astah community
#cask 'astah-community'

# dockertoolbox(docker engine, docker-compose, docker-machine)
#cask 'dockertoolbox'  #Legacy desktop solution. Docker Toolbox is for older Mac and Windows systems that do not meet the requirements

cask 'cakebrew' #The GUI Mac App for Homebrew.
cask "onyx" #Mac 定番メンテナンスツール
cask "vlc"
cask 'messenger' #facebook メッセンジャー
cask 'pycharm-ce' #python 用 IDE(統合開発環境)
cask 'google-backup-and-sync' #google drive
cask 'timemachineeditor'
