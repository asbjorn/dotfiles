#!/bin/bash

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -hF --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -lhF'
alias la='ls -A'
alias ltree='ls -Csu'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias eclipse="$HOME/.local/eclipse/eclipse &"
alias androidstudio="$HOME/android-studio/android-studio/bin/studio.sh"

# rot13 "encryption" / obfusication
alias rot13="tr '[A-Za-z]' '[N-ZA-Mn-za-m]'"
alias unrot13="tr '[N-ZA-Mn-za-m]' '[A-Za-z]' "

# base64 handling
alias enc_base64="openssl base64 -e"
alias dec_base64="openssl base64 -d"

# SHA1
alias sha1="openssl sha1"

