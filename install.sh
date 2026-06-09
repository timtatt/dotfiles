#!/bin/bash

echo "Starting to install shit"

## Neovim

if ! command -v nvim &> /dev/null; then
		echo "Install neovim"
		brew install neovim
fi

if [[ ! -d ~/.config/nvim ]]; then
		echo "Adding NVIM symlink"
		ln -s $(pwd)/nvim ~/.config/nvim
fi


if ! command -v rg &> /dev/null; then
		echo "Install ripgrep"
		brew install ripgrep
fi


## Ghostty

if [[ ! -d ~/.config/ghostty ]]; then
	echo "Creating Ghostty symlink"
	mkdir -p ~/.config/ghostty
	ln -s $(pwd)/ghostty/config ~/.config/ghostty/config.ghostty
fi


## Python

if ! command -v pyenv &> /dev/null; then
		echo "Install PyEnv"
		brew install pyenv
		pyenv init --install
fi


## NodeJS

if [[ ! -d ~/.nvm ]]; then
	echo "Install Node Version Manager"
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.5/install.sh | bash
	source ~/.nvm/nvm.sh

	echo "Installing NodeJS v24"
	nvm install 24
fi

## oh-my-zsh config and plugins

if [[ ! -d ~/.oh-my-zsh ]]; then
	echo "Install oh-my-zsh"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

	echo "Using zshrc symlink"
	rm ~/.zshrc
	ln -s $(pwd)/zsh/.zshrc ~/.zshrc
fi

zshFzfDir=${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-fzf-history-search
if [[ ! -d "$zshFzfDir" ]]; then
	echo "Install zsh-fzf-history-search"
	git clone https://github.com/joshskidmore/zsh-fzf-history-search "$zshFzfDir"
fi


## Git

if ! command -v lazygit &> /dev/null; then
		echo "Install lazygit"
		brew install lazygit
fi

if [[ ! -f ~/.gitconfig ]]; then
	echo "Create .gitconfig symlink"
	ln -s $(pwd)/git/.gitconfig ~/.gitconfig
fi

if [[ ! -d ~/.config ]]; then
		echo "Creating .config dir"
		mkdir ~/.config
fi

# Taskfile

if ! command -v task &> /dev/null; then
		echo "Install Task"
		brew install go-task/tap/go-task
fi

# fzf

if ! command -v fzf &> /dev/null; then
		echo "Install fzf"
		brew install fzf
fi


# tmux

if ! command -v tmux &> /dev/null; then
		echo "Install tmux"
		brew install tmux
fi

if [[ ! -f ~/.tmux.conf ]]; then
	echo "Create tmux conf symlink"
	ln -s $(pwd)/tmux/.tmux.conf ~/.tmux.conf
fi


if [[ ! -d ~/.config/tmux-sessionizer ]]; then
	echo "Adding tmux-sessionizer config"
	mkdir ~/.config/tmux-sessionizer
	ln -s $(pwd)/tmux/tmux-sessionizer.conf ~/.config/tmux-sessionizer/tmux-sessionizer.conf
fi

# local bin symlink
if [[ ! -d ~/.local/bin ]]; then
	echo "Adding .local/bin"
	mkdir -p ~/.local/bin
fi

if [[ ! -f ~/.local/bin/tmux-sessionizer ]]; then
	echo "Adding .local/bin/tmux-sessionizer"
	ln -s $(pwd)/bin/tmux-sessionizer ~/.local/bin/tmux-sessionizer
fi


echo "Finished installing shit"
