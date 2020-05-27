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
echo "Linking over git configs"
ln -sf ~/dotfiles/git/.gitconfig ~/.gitconfig
echo "Linking over zsh configs"
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/dotfiles/zsh/.zsh_configs ~/.zsh_configs
echo "Linking over vim configs"
ln -sf ~/dotfiles/vim/.vim ~/.vim
ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc
echo "Linking over aliases configs"
ln -sf ~/dotfiles/aliases/.aliases ~/.aliases
echo "Linking over bash configs"
ln -sf ~/dotfiles/bash/.bashrc ~/.bashrc
ln -sf ~/dotfiles/bash/.bash_profile ~/.bash_profile
ln -sf ~/dotfiles/bash/.bash_prompt ~/.bash_prompt
echo "Linking over tmux configs"
ln -sf ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf

# Set up FZF
echo "Installing FZF"
git clone --depth 1 git@github.com:junegunn/fzf.git ~/.fzf
~/.fzf/install

echo "Done!"
