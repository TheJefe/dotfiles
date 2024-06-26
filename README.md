Jeff's dotfiles
===============

This project is using [Holmans Dotfiles bootstrap](https://github.com/holman/dotfiles)

osx customizations came from [github.com/mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles/blob/master/.osx)

## Prerequisites

- [Homebrew](https://brew.sh)
- `brew bundle` To install all brew dependencies
- [LiquidPrompt](https://github.com/nojhan/liquidprompt) installed to `/git/liquidprompt`
- [Starship](https://starship.rs)
  - `brew install starship`
- [Powerline](https://powerline.readthedocs.org/en/latest/installation.html) installed
  - `brew install git`
  - `brew install python`
  - `brew install python@2`
  - `brew install bash`

## To install

    git clone git@github.com:jkoenig311/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
    git submodule init
    git submodule update
    ./script/bootstrap

## Vim

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim
:PlugInstall
```

## Powerline

```bash
brew install socat
pip install psutil
brew install libgit2
pip install pygit2
pip install hglib
pip install breezy
pip install pyuv
pip install i3ipc
pip install powerline-status
```

## MacVim

`brew install macvim --with-override-system-vim`

## Tmux

`brew install tmux --HEAD`

using `--HEAD` to get latest unreleased changes. Specifically to support links

### iTerm Setup and install patched font

- download from https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Inconsolata/complete/Inconsolata%20Nerd%20Font%20Complete.otf
- Have iTerm use this font for both ASCII and NON-ASCII characters
- Set the login command to `/usr/local/bin/bash -l`, this tells it to use the brew version of bash
- Set iterm start command as `tmux attach-session -t hacking || tmux new-session -s hacking -n neo`

### hyperlink support

requires installing tmux from source to get version 3.4 which is not currently available in homebrew
```
cd ${TMUX_SRC_PATH}
sh autogen.sh
./configure --enable-utf8proc && make
```

additionally requires a hotfix to powerline to maintain support for the "next-3.4" version of tmux


`~/.pyenv/versions/3.11.5/lib/python3.11/site-packages/powerline/bindings/tmux/__init__.py:84`

```
if version_string == 'next-3.4':
    return TmuxVersionInfo(float('inf'), 0, version_string)
```

## Spacemacs

```bash
brew tap d12frosted/emacs-plus
brew install emacs-plus@29 --with-spacemacs-icon

git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
```

### Troubleshooting environment path and variables

run `SPC SPC force-init-spacemacs-env`

## Bash completion 2

```bash
brew install bash-completion2
```

docker bash auto completion on macs
```bash
curl https://raw.githubusercontent.com/docker/docker-ce/master/components/cli/contrib/completion/bash/docker \
-o $(brew --prefix)/etc/bash_completion.d/docker
```

## Other packages

[SizeUp](https://www.irradiatedsoftware.com/sizeup/)
```bash
brew install ispell  # used for spell checking in spacemacs
brew install thefuck # awesome tool for fixing screwed up commands
brew install bat # cat replacement
brew install fzf
$(brew --prefix)/opt/fzf/install # To install useful key bindings and fuzzy completion:
```

## Slack theme

`#000000,#350D36,#635DFF,#FFFFFF,#2A2E35,#FFFFFF,#635DFF,#FF4F40,#000000,#FFFFFF`

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
