#!/usr/bin/env bash

DOTFILES_CWD=`pwd`
ln -nfs $DOTFILES_CWD/dot.tmux.conf ${HOME}/.tmux.conf
ln -nfs $DOTFILES_CWD/dot.zshrc ${HOME}/.zshrc
ln -nfs $DOTFILES_CWD/dot.vimrc ${HOME}/.vimrc
ln -nfs $DOTFILES_CWD/dot.config ${HOME}/.config
ln -nfs $DOTFILES_CWD/dot.ssh ${HOME}/.ssh

