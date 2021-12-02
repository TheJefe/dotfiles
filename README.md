Jeff's dotfiles
===============

This project is using [Holmans Dotfiles bootstrap](https://github.com/holman/dotfiles)

osx customizations came from [github.com/mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles/blob/master/.osx)

## Prerequisites

- [Homebrew](https://brew.sh)
- [LiquidPrompt](https://github.com/nojhan/liquidprompt) installed to `/git/liquidprompt`
- [Starship](https://starship.rs)
  - `brew install starship`
- [Powerline](https://powerline.readthedocs.org/en/latest/installation.html) installed
  - `brew install git`
  - `brew install python`
  - `brew install python@2`

## To install

    git clone git@github.com:jkoenig311/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
    git submodule init
    git submodule update
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    ./script/bootstrap
    vim
    :BundleInstall

## Powerline

```bash
brew install socat
pip install psutil
brew install libgit2
pip install pygit2
pip install hglib
pip install bzr
pip install pyuv
pip install i3ipc
pip install powerline-status
```

## MacVim

`brew install macvim --with-override-system-vim`

## Tmux

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

## iTerm

*Preferences -> Profiles -> default -> General*
*Commmand*: `/usr/local/bin/bash -l`
*Send text at start*: `tmux attach-session -t _hacking || tmux new-session -s _hacking -n neo`

## Other packages

```bash
brew install ispell  # used for spell checking in spacemacs
brew install thefuck # awesome tool for fixing screwed up commands
brew install bat # cat replacement
brew install fzf
$(brew --prefix)/opt/fzf/install # To install useful key bindings and fuzzy completion:
```

## Troubleshooting

If you see errors like this..

```
-bash: declare: -A: invalid option
declare: usage: declare [-afFirtx] [-p] [name[=value] ...]
-bash: complete: -D: invalid option
complete: usage: complete [-abcdefgjksuv] [-pr] [-o option] [-A action] [-G globpat] [-W wordlist] [-P prefix] [-S suffix] [-X filterpat] [-F function] [-C command] [name ...]
```

Then the wrong version of bash is being used when starting up. It could be that
you are still using the bash executable that came with the OS. In the case of using
TMUX, it could be the configuration using the wrong bash executable.
