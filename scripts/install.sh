#! /bin/bash

echo "Please enter SUDO password"
sudo echo "Installing..."
PREVIOUS_DIR=`pwd`;
cd ~

echo "Installing deps..."
~/dotfiles/scripts/install_deps.sh

echo "setting zsh to default..."
CURRENT_USER=`whoami`
sudo chsh -s $(which zsh) $CURRENT_USER

echo "Setting up repo..."
cd ~/dotfiles
git submodule init
git submodule update

echo "Creating symlinks..."
~/dotfiles/scripts/build_symlinks.sh

echo "Creating vim backup dir..."
mkdir ~/.vim/backup

echo "Installing vim plugins..."
vim +PlugInstall +qa

echo "Installing italics terminfo"
tic ~/dotfiles/xterm-256color-italic.terminfo

echo "Dotfiles installed!"
cd $PREVIOUS_DIR
