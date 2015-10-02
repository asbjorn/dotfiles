#!/bin/bash

function random_key () {
    RANDOM_LEN=${1-32}
    python -c "import os;print os.urandom($RANDOM_LEN)"
}

function random_token () {
    RANDOM_LEN=${1-32}
    python -c "import random; import string;\
        print ''.join(\
        random.choice(string.letters + string.digits) for _ in range($RANDOM_LEN))"
}


function noproxy() {
    export http_proxy=""
    export https_proxy=""
    export ftp_proxy=""
    export socks_proxy=""
    export no_proxy=""
    echo "Nullify proxy settings"
}


function setproxy() {
    local statoil_proxy=http://www-proxy.statoil.no:80
    export http_proxy=$statoil_proxy
    export https_proxy=$statoil_proxy
    export ftp_proxy=$statoil_proxy
    export socks_proxy=$statoil_proxy
    export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
}

# go up n directories
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


function stelnet() 
{
    if [[ $# != 2 ]]; then
        echo "usage: $0 <host> <port>"
    else
        openssl s_client -quiet -connect $1:$2
    fi
}


function enc_sym_string()
{
    if [[ $# != 1 ]]; then
        echo "usage: $0 \"string to encrypt with symmetric key here\""
    else
        echo -n $1 | gpg --armor -c --output -
    fi
}

#function dec_sym_string()
#{
#    if [[ $# != 1 ]]; then
#        echo "usage: $0 \"string to encrypt with symmetric key here\""
#    else
#        echo -n $1 | gpg --armor -c --output -
#    fi
#}

function encrypt_file()
{
    if [[ $# != 1 ]]; then
        echo "usage: $0 \"file_to_encrypt\""
    else
        openssl enc -aes-256-cbc -salt -in $1 -out $1.enc
    fi
}

function decrypt_file()
{
    if [[ $# -lt 1 ]]; then
        echo "usage: $0 \"file_to_decrypt\" <\"optional_file_output_name\">"
    else
        output="${1}.orig"
        openssl enc -aes-256-cbc -salt -in $1 -out $output -d
    fi
    
}

function ppjson
{
    if [[ -n $1 ]]; then
        cat $1 | python -mjson.tool
        #if [[ -e $1 ]]; then
        #else
        #    echo "Can't find $1"
        #fi
    else
        # read from stdin
        while read data
        do
            echo $data | python -mjson.tool
        done
    fi
}

function calc() {
    echo $1 | bc
}

function ppxml() {
    echo $1 | python -c "from lxml import etree;  import sys; parser = etree.XMLParser(remove_blank_text=True); n = sys.stdin.readline().rstrip(); tree = etree.parse(n, parser); tree.write(sys.stdout, pretty_print=True)"
}

function topmemprocs() {
    ps axo rss,comm,pid \
        | awk '{ proc_list[$2] += $1; } END \
            { for (proc in proc_list) { printf("%d\t%s\n", proc_list[proc],proc); }}' \
        | sort -n | tail -n 10 | sort -rn \
        | awk '{$1/=1024;printf "%.0fMB\t",$1}{print $2}'
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f ~/google-cloud-sdk/path.bash.inc ]; then
    . ~/google-cloud-sdk/path.bash.inc
fi

# The next line enables bash completion for gcloud.
if [ -f ~/google-cloud-sdk/completion.bash.inc ]; then
    . ~/google-cloud-sdk/completion.bash.inc
fi

