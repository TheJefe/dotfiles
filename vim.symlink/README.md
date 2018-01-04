.vim
====
### Installation:

    git clone git@github.com:jkoenig311/.vim.git ~/.vim
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    ln -s ~/.vim/vimrc.symlink ~/.vimrc
    ln -s ~/.vim/gvimrc.symlink ~/.gvimrc
    vim
    :BundleInstall

## Gitgutter started being slowing and introducing bugs at some point, so lets checkout a known good version
    cd ~/.vim/bundle/vim-gitgutter
    git checkout dbfbbb4

## Build vimproc
    cd ~/.vim/bundle/vimproc.vim/
    make

### How to Install new plugins

Open vimrc, add a line `Plugin 'tpope/vim-fugitive'`

### Upgrade all bundled plugins:

    git submodule foreach git pull origin master
