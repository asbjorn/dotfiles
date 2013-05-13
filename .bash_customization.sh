# Change the BASH prompt when we are inside a Git repo
GIT_PS1_SHOWDIRTYSTATE=true
export PS1="\[\033[01;32m\]\u@\h\$(__git_ps1)\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "

# Function to output a random_key. Default is a 32 item length, while 
# you may specify another length as an argument
random_key () {
    if [[ -z "$1" ]]; then
        RANDOM_LEN=32
    else
        RANDOM_LEN=$1
    fi
    python -c "import os;print os.urandom($RANDOM_LEN)"
}

# Reset proxy settings
function noproxy() {
    export http_proxy=""
    export https_proxy=""
    export ftp_proxy=""
    export socks_proxy=""
    echo "Nullify proxy settings"
}

# Set proxy settings
function setproxy() {
    local company_proxy=http://www-proxy.company.com:80
    export http_proxy=$company_proxy
    export https_proxy=$company_proxy
    export ftp_proxy=$company_proxy
    export socks_proxy=$company_proxy
}

# go up N directories
function up()
{
    local str=""
    local count=0
    while [[ "$count" -lt "$1" ]] ;
    do
        str=$str"../"
        let count=count+1
    done
    cd $str
}
