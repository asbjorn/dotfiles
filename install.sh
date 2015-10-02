#!/bin/bash

P=$(dirname "$0")
echo $P
cd $(dirname "$0")
echo "PWD -> $PWD"
BACKUPDIR=$HOME/dotfiles_old

INSTALLDIR=$HOME/dot_test
test -d $INSTALLDIR || mkdir $INSTALLDIR

# Create backup dir if not already created
test -d $BACKUPDIR || mkdir $BACKUPDIR

link() {
    echo "Link '$HOME/.$1'"
    if [ ! -h $HOME/.$1 ]; then
        # Take backup if exists
        if [ -e $HOME/.$1 ]; then
            echo "  Backup of $HOME/.$1 to $BACKUPDIR"
            cp -Ra $HOME/.$1 $BACKUPDIR
        fi

        #ln -s "`pwd`/$1" "$HOME/.$1"
        if [ -h $INSTALLDIR/.$1 ]; then
            echo "  Link $INSTALLDIR/.$1 already exists. Delete first."
            rm $INSTALLDIR/.$1
        fi
        ln -s "`pwd`/$1" "$INSTALLDIR/.$1"
    fi
}

echo "init vim >>>"
link vimrc

if [ ! -d vim/bundle/vundle ]; then
    git clone https://github.com/gmarik/vundle.git vim/bundle/vundle
fi

# VIM
link vim_test
link gvimrc

# Git specific
link gitconfig
link gitmessage

# tmux
link tmux.conf

# Shell
link bashrc
link bash_aliases
link bash_functions.sh
