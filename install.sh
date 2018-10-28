# installz zsh configs
rm ~/.zshrc
ln -s ./zsh/zshrc ~/.zshrc

# install powerline fonts
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

# install vim configs
cd ~
rm -rf .vim
rm .vimrc
git clone https://github.com/RobertYCXu/vim-config .vim
# link .vimrc with vimrc in .vim
ln -s ~/.vim/vimrc ~/.vimrc

# install oh my zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

