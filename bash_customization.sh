# Change the BASH prompt when we are inside a Git repo
GIT_PS1_SHOWDIRTYSTATE=true
export PS1="\[\033[01;32m\]\u@\h\$(__git_ps1)\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "

# The one and only <3
export EDITOR=vim

# Setting my default PGP key
export GPGKEY=A7A2DAEC

# User install path
export PATH=$HOME/.local/bin:$PATH
export LD_LIBRARY_PATH=$HOME/.local/lib:$LD_LIBRARY_PATH

# Go
export GOPATH=$HOME/.local/goprojects
export PATH=$PATH:$GOPATH/bin

# Autorandr
export PATH=$HOME/.local/autorandr/:$PATH
