#!/bin/bash

P=$(dirname "$0")
echo $P
cd $(dirname "$0")
echo "PWD -> $PWD"
BACKUPDIR=$HOME/dotfiles_backup

test -d $INSTALLDIR || mkdir $INSTALLDIR

# Create backup dir if not already created
test -d $BACKUPDIR || mkdir $BACKUPDIR

ask() {
    # http://djm.me/ask
    while true; do

        if [ "${2:-}" = "Y" ]; then
            prompt="Y/n"
            default=Y
        elif [ "${2:-}" = "N" ]; then
            prompt="y/N"
            default=N
        else
            prompt="y/n"
            default=
        fi

        # Ask the question - use /dev/tty in case stdin is redirected from somewhere else
        read -p "$1 [$prompt] " REPLY </dev/tty

        # Default?
        if [ -z "$REPLY" ]; then
            REPLY=$default
        fi

        # Check if the reply is valid
        case "$REPLY" in
            Y*|y*) return 0 ;;
            N*|n*) return 1 ;;
        esac

    done
}

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

echo "This will install these 'dotfiles' to your \$HOME environment."
echo "It will take a backup of everything to '$BACKUPDIR', but "
echo "be aware that many things will likely change."
echo 

if ask "Are you sure you want to continue?"; then
    # VIM
    echo "init vim >>>"
    link vimrc
    link gvimrc
    if [ ! -d vim/bundle/vundle ]; then
        git clone https://github.com/gmarik/vundle.git vim/bundle/vundle
    fi
    link vim
    
    # Git specific
    link gitconfig
    link gitmessage
    
    # tmux
    link tmux.conf
    
    # Shell
    link bashrc
    link bash_aliases
    link bash_functions.sh
    link bash_customization.sh
else
    echo "Quiting."
    echo "Haven't touched a thing! Pinky-swear!"
fi

