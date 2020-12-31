#!/bin/bash -v

SCRIPT_DIR=$(dirname $(realpath $0))
export PATH=$HOME/.local/bin:$PATH
$SCRIPT_DIR/scripts/install_tools
hash -r

if ! command -v stow &> /dev/null
then
    echo "stow could not be found, installing"
    $SCRIPT_DIR/scripts/install_stow
    hash -r
fi

STOW="stow --dotfiles"
OS=$(uname -s)
echo "OS is $OS"
echo "start dotfile install"
git submodule init
git submodule update --recursive
here=$PWD
echo "the dotfile location is $here"
cat /etc/shells | grep -q "zsh"
mkdir -p $HOME/bin

cp $SCRIPT_DIR/misc/bin/* $HOME/bin

# Darwin is MacOS
if [ $OS = "Darwin" ] ;then
    $STOW zsh-mac
elif [ $OS = "Linux" ] ;then
    $STOW zsh-linux
fi

$STOW zsh-common

$STOW tmux
$STOW vim
$STOW git
$STOW editorconfig

VIM=vim
if command -v nvim &> /dev/null; then
    VIM=nvim
fi

$VIM +PlugInstall +qall

exec zsh
