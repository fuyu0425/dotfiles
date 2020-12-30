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
have_zsh=$?

mkdir -p $HOME/bin


echo "install YouCompletme? (y/n) default is y"
read answer
install_youcompletme=1
if echo "${answer:=y}"|grep -iq '^y' ;then
    install_youcompletme=1
else
    install_youcompletme=0
fi

# Darwin is MacOS
if [ $OS = "Darwin" ] ;then
    $STOW zsh-mac
elif [ $OS = "Linux" ] ;then
    if [ $have_zsh -ne 0 ];then
        sudo apt install -y zsh
    fi
    $STOW zsh-linux
fi

$STOW zsh-common

$STOW tmux
$STOW vim
$STOW git
$STOW editorconfig

if [ $install_youcompletme -eq 0 ];then
    sed -i -e s@"Plug 'Valloric/YouCompleteMe'"@"\"Plug 'Valloric/YouCompleteMe'"@g $HOME/.vimrc
fi

vim +PlugInstall +qall

if [ $install_youcompletme -ne 0 ];then
    echo "build youcomplete me yourself"
fi
echo "complete"

# git config
git config --global credential.helper cache

exec zsh
