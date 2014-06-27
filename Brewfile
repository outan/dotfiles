# make sure we’re using the latest Homebrew
#brew update

# Upgrade any already-installed formulae
#brew upgrade

# Add repositories
tap homebrew/versions || true
tap caskroom/cask || true
tap caskroom/versions || true


# Install GNU core utilities (those that come with OS X are outdated)
brew  'coreutils'
#echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew  'findutils'

# Install Bash 4
brew  'bash'

# Install wget with IRI support
brew  'wget --enable-iri'

brew  'curl'

brew  'tmux'

brew  'zsh'

brew  'rbenv'

brew  'mysql'

brew  'tree'

#make less command show color
brew  'source-highlight'

brew  'git'

#.gitconfig設定後、git log -pでは文字化けという現象の対処
brew  'lv'

#gitのログを見やすくする
brew  'tig'

#git branch管理用のツール
brew  'git-flow'

brew  'openssl'
brew  'curl-ca-bundle'
brew 'ack'
brew 'ag'
brew 'hub'

brew 'terminal-notifier'

brew install lsyncd || true

brew install redis || true

brew install rmtrash || true

#perl,pythonインストール
brew install pyenv plenv perl-build

# Remove outdated versions from the cellar
#brew cleanup
