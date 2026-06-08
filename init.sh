#!/bin/bash

echo "Starting to install shit"

## Neovim

if ! command -v nvim &> /dev/null; then
		echo "Install neovim"
		brew install neovim
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

if [[ ! -d ~/.config/nvim ]]; then
		echo "Adding NVIM symlink"
		ln -s $(pwd)/nvim ~/.config/nvim
fi






echo "Finished installing shit"
