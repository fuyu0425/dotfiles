#!/bin/sh -xe
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
cp -rn $here/common/bin $HOME/bin


echo "install YouCompletme? (y/n) default is y"
read answer
install_youcompletme=1
if echo "${answer:=y}"|grep -iq '^y' ;then
    install_youcompletme=1
else
    install_youcompletme=0
fi

# install oh-my-zsh
if [ ! -d $HOME/.oh-my-zsh ];then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
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

# My Custom theme
ln -fs $here/misc/fuyu0425.zsh-theme $HOME/.oh-my-zsh/themes
git clone https://github.com/popstas/zsh-command-time.git ~/.oh-my-zsh/custom/plugins/command-time


echo "common settings start"

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
