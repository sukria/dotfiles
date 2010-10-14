DOTFILES=$(HOME)/.dotfiles

install: install_main install_vim install_bash install_git

install_main:
	mkdir -p $(DOTFILES)

install_vim:
	mkdir -p $(DOTFILES)/vim
	install -m 0644 vim/vimrc $(DOTFILES)/vim/vimrc
	install -m 0644 vim/common.vim $(DOTFILES)/vim/common.vim
	install -m 0644 vim/perl.vim $(DOTFILES)/vim/perl.vim
	install -m 0644 vim/ruby.vim $(DOTFILES)/vim/ruby.vim
	install -d $(DOTFILES)/vim/compiler
	install -m 0644 vim/compiler/perlcritic.vim $(DOTFILES)/vim/compiler/perlcritic.vim
	install -m 0644 vim/compiler/perltest.vim $(DOTFILES)/vim/compiler/perltest.vim
	install -d $(DOTFILES)/vim/plugin
	install -m 0644 vim/plugin/fugitive.vim $(DOTFILES)/vim/plugin/fugitive.vim
	install -m 0644 vim/plugin/vtreeexplorer.vim $(DOTFILES)/vim/plugin/vtreeexplorer.vim

install_bash:
	mkdir -p $(DOTFILES)/bash
	install -m 0644 bash/bashrc $(DOTFILES)/bash/bashrc
	install -m 0644 bash/bash_aliases $(DOTFILES)/bash/bash_aliases
	install -m 0644 bash/git.sh $(DOTFILES)/bash/git.sh
	install -m 0644 bash/prompt.sh $(DOTFILES)/bash/prompt.sh

install_git:
	mkdir -p $(DOTFILES)/git
	install -m 0644 git/gitconfig $(DOTFILES)/git/gitconfig
