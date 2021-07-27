#!/usr/bin/env bash

# bash
ln -sf $HOME/.dotfiles/.bashrc ~/.bashrc
ln -sf $HOME/.bashrc ~/.bash_profile

# vim
ln -sf $HOME/.dotfiles/vim/ ~/.vim/

# tmux
ln -sf $HOME/.dotfiles/.tmux.conf ~/.tmux.conf

# git
ln -sf $HOME/.dotfiles/.gitconfig ~/.gitconfig
ln -sf $HOME/.dotfiles/.gitignore ~/.gitignore

echo -e "done!"
