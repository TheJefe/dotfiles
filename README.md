Jeff's dotfiles
===============

This project is using [Holmans Dotfiles bootstrap](https://github.com/holman/dotfiles)

osx customizations came from [github.com/mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles/blob/master/.osx)

## Prerequisites

- [LiquidPrompt](https://github.com/nojhan/liquidprompt) installed to `/git/liquidprompt`
- [Powerline](https://powerline.readthedocs.org/en/latest/installation.html) installed
  - `brew install git`
  - `brew install python`
  - `brew install python@2`
  - `pip install powerline-status`

## To install

    git clone git@github.com:jkoenig311/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
    git submodule init
    git submodule update
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    ./script/bootstrap
    vim
    :BundleInstall

## MacVim

`brew install macvim --with-override-system-vim`

## Tmux

`brew install reattach-to-user-namespace`
`brew install tmux`

### Install patched font

- download from https://github.com/powerline/fonts/blob/master/Inconsolata/Inconsolata%20for%20Powerline.otf
- Have iTerm use this font for both ASCII and NON-ASCII characters
- Set the login command to `/usr/local/bin/bash -l`, this tells it to use the brew version of bash
- Set iterm start command as `tmux attach-session -t hacking || tmux new-session -s hacking -n neo`

## Spacemacs

```bash
brew tap d12frosted/emacs-plus
brew install emacs-plus
brew linkapps emacs-plus
brew cask
brew cask install emacs

git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
```

## Bash completion 2

```bash
brew tap homebrew/versions
brew install bash-completion2
```

## Other packages

```bash
brew install ispell  # used for spell checking in spacemacs
brew install thefuck # awesome tool for fixing screwed up commands
```
