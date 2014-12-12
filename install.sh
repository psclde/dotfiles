#!/bin/sh

printf "Cloning oh-my-zsh \t"
if [ ! -d .oh-my-zsh ]; then
    printf "\n"
    git clone git://github.com/robbyrussell/oh-my-zsh.git .oh-my-zsh
    printf "\n"
else
    printf "already installed!\n"
fi

printf "Cloning Vundle \t"
if [ ! -d .vim/bundle/Vundle.vim ]; then
    printf "\n"
    git clone https://github.com/gmarik/Vundle.vim.git .vim/bundle/Vundle.vim
    printf "\n"
else
    printf "alread installed!\n"
fi

printf "Creating symlinks\n"
DIR=$(cd $(dirname $0); pwd)
[ ! -h ~/.tmux.conf ] && ln -s $DIR/.tmux.conf ~/.tmux.conf
[ ! -h ~/.vim ] && ln -s $DIR/.vim ~/.vim
[ ! -h ~/.vimrc ] && ln -s $DIR/.vimrc ~/.vimrc
[ ! -h ~/.oh-my-zsh ] && ln -s $DIR/.oh-my-zsh ~/.oh-my-zsh
[ ! -h ~/.zshenv ] && ln -s $DIR/.zshenv ~/.zshenv
[ ! -h ~/.zshrc ] && ln -s $DIR/.zshrc ~/.zshrc

printf "Finished\n"
