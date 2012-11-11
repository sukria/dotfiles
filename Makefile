DOTFILES=$(HOME)/.dotfiles

install: install_main install_vim install_bash install_git

install_main:
	mkdir -p $(DOTFILES)

install_bash:
	mkdir -p $(DOTFILES)/bash
	install -m 0644 bash/bashrc $(DOTFILES)/bash/bashrc
	install -m 0644 bash/bash_aliases $(DOTFILES)/bash/bash_aliases
	install -m 0644 bash/git.sh $(DOTFILES)/bash/git.sh
	install -m 0644 bash/prompt.sh $(DOTFILES)/bash/prompt.sh

install_git:
	mkdir -p $(DOTFILES)/git
	install -m 0644 git/gitconfig $(DOTFILES)/git/gitconfig
