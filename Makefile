DOTFILES_EXCLUDES := .DS_Store .git .gitmodules .swp ~ .travis.yml
DOTFILES_TARGET   := $(wildcard .??*) 
DOTFILES_DIR      := $(PWD)
DOTFILES_FILES    := $(filter-out $(DOTFILES_EXCLUDES), $(DOTFILES_TARGET))

all: update deploy init

help:
	@echo "make list           #=> List the files"
	@echo "make update         #=> Fetch changes from the main and all submodule repo"
	@echo "make deploy         #=> Create symlink in home directory"
	@echo "make init           #=> Setup environment"
	@echo "make install        #=> Updating, deploying and initializng"
	@echo "make clean          #=> Remove the dotfiles directory and all symbolic links"
	@echo "make undeploy       #=> delete all symlinks"
	@echo "make homebrew       #=> Install homebrew if you have no homebrew"
	@echo "make brew           #=> Update brew packages"
	@echo "make cask           #=> Update cask packages"

list:
	@$(foreach val, $(DOTFILES_FILES), ls -dF $(val);)

update:
	git pull origin master
	git submodule init
	git submodule update
	git submodule foreach git pull origin master

deploy:
	@echo 'Create symlinks of dotfiles of current directory into home directory'
	@echo ''
	@$(foreach val, $(DOTFILES_FILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

init:
	@$(foreach val, $(wildcard ./etc/init/*.sh), bash $(val);)
ifeq ($(shell uname), Darwin)
	@$(foreach val, $(wildcard ./etc/init/osx/*.sh), bash $(val);)

homebrew:
	@bash $(DOTFILES_DIR)/etc/init/osx/install_homebrew.sh

brew: homebrew
	@bash $(DOTFILES_DIR)/etc/init/osx/Brewfile

cask: homebrew
	@bash $(DOTFILES_DIR)/etc/init/osx/Caskfile
endif

install: update deploy init
	@exec $$SHELL

clean:
	@echo 'Remove all symlinks and dotfile directory in your home directory...'
	@-$(foreach val, $(DOTFILES_FILES), rm -vrf $(HOME)/$(val);)
	-rm -rf $(DOTFILES_DIR)
undeploy:
	@echo 'Delete all symlinks in your home directory...'
	@-$(foreach val, $(DOTFILES_FILES), rm -vrf $(HOME)/$(val);)
