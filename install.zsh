#!/bin/zsh

# Install git and xclip
sudo pacman -S git xclip;

# Setup ssh key
ssh-keygen -t rsa -b 4096 -C "nokaa@cock.li";
eval "$(ssh-agent -s)";
ssh-add ~/.ssh/id_rsa;

# Setup ZSH
git clone --recursive https://git.nokaa.moe/nokaa/prezto.git ~/.zprezto;
setopt EXTENDED_GLOB
for rcfile in ~/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "~/.${rcfile:t}"
done

# Symlink dotfiles
# We don't want every folder in config in our dotfiles,
# so we only symlink the folders we want.
mkdir -p ~/.config;
for folder in config; do
    ln -s "$folder" "~/.config"
done

ln -s `pwd`/.themes ~
ln -s `pwd`/.gtkrc-2.0 ~

ln -s `pwd`/.dircolors ~
ln -s `pwd`/.tmux.conf ~
ln -s `pwd`/.muttrc ~

# copy bin dir
cp -r bin ~

# Install neovim dependencies, clone, make, and install neovim
sudo pacman -S base-devel cmake unzip;
git clone https://github.com/neovim/neovim.git ~/neovim;
cd ~/neovim;
sudo make install;

# Programming setup
mkdir -p ~/Programming/Projects;
mkdir -p ~/Programming/git/nokaa;
