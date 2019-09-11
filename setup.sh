#!/bin/bash

# Init git submodules (for vim plugins)
echo "Init git submodules"
git submodule update --init

# Install oh-my-zsh
echo "Installing oh-my-zsh"
rm -rf ~/.oh-my-zsh
chsh -s /usr/bin/zsh
curl -L http://install.ohmyz.sh | sh || true

# Copy current dotfiles to temp directory
echo "Removing folder ~/dotfiles_old if it exists"
rm -rf ~/dotfiles_old
echo "Creating new folder ~/dotfiles_old"
mkdir ~/dotfiles_old

# Git
echo "Deprecating ~/.gitconfig"
mv ~/.gitconfig ~/dotfiles_old

# Zsh
echo "Deprecating ~/.zshrc"
mv ~/.zshrc ~/dotfiles_old
echo "Deprecating ~/.zsh_configs"
mv ~/.zsh_configs ~/dotfiles_old

# Vim
echo "Deprecating ~/.vimrc"
mv ~/.vimrc ~/dotfiles_old
echo "Deprecating ~/.vim"
mv ~/.vim ~/dotfiles_old

# Aliases
echo "Deprecating ~/.aliases"
mv ~/.aliases ~/dotfiles_old

# Bash
echo "Deprecating ~/.bashrc"
mv ~/.bashrc ~/dotfiles_old
echo "Deprecating ~/.bash_profile"
mv ~/.bash_profile ~/dotfiles_old
echo "Deprecating ~/.bash_prompt"
mv ~/.bash_prompt ~/dotfiles_old

# Tmux
echo "Deprecating ~/.tmux.conf"
mv ~/.tmux.conf ~/dotfiles_old

# Set up dotfiles
echo "Setting up new dotfiles"
echo "Copying over git configs"
cp -a ./git/. ~/
echo "Copying over zsh configs"
cp -a ./zsh/. ~/
echo "Copying over vim configs"
cp -a ./vim/. ~/
echo "Copying over aliases configs"
cp -a ./aliases/. ~/
echo "Copying over bash configs"
cp -a ./bash/. ~/
echo "Copying over tmux configs"
cp -a ./tmux/. ~/

# Set up FZF
echo "Installing FZF"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo "Done!"
