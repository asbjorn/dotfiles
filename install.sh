#!/bin/bash

P=$(dirname "$0")
echo $P
cd $(dirname "$0")
echo "PWD -> $PWD"
BACKUPDIR=$HOME/dotfiles_backup

test -d $INSTALLDIR || mkdir $INSTALLDIR

# Create backup dir if not already created
test -d $BACKUPDIR || mkdir $BACKUPDIR

link() {
    echo "Link '$HOME/.$1'"
    if [ ! -h $HOME/.$1 ]; then
        # Take backup if exists
        if [ -e $HOME/.$1 ]; then
            echo "  Backup of $HOME/.$1 to $BACKUPDIR"
            if [ -e $BACKUPDIR/.$1 ]; then
                rm -rf $BACKUPDIR/.$1
            fi
            cp -Ra $HOME/.$1 $BACKUPDIR
        fi

        #ln -s "`pwd`/$1" "$HOME/.$1"
        ln -s "`pwd`/$1" "$HOME/.$1"
    else
        echo "  '$HOME/.$1' already a symlink!"
    fi
}

# VIM
echo "init vim >>>"
link vimrc
if [ ! -d vim/bundle/vundle ]; then
    git clone https://github.com/gmarik/vundle.git vim/bundle/vundle
fi
link vim
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
