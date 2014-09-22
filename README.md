Jeff's dotfiles
===============

This project is using [Holmans Dotfiles bootstrap](https://github.com/holman/dotfiles)

osx customizations came from [github.com/mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles/blob/master/.osx)

## Prerequisites

(LiquidPrompt)[https://github.com/nojhan/liquidprompt] installed to `/git/liquidprompt`
(Powerline)[https://powerline.readthedocs.org/en/latest/installation.html] installed

## To install

    git clone git@github.com:jkoenig311/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
    git submodule init
    git submodule update
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    ./script/bootstrap
    vim
    :BundleInstall
