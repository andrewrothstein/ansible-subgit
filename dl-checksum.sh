#!/usr/bin/env bash
set -e
DIR=~/Downloads
MIRROR=https://subgit.com/download

dl() {
    local -r ver=$1
    local -r file=subgit-${ver}.zip
    local -r url="${MIRROR}/${file}"
    local -r lfile="$DIR/${file}"

    if [ ! -e $lfile ];
    then
        curl -sSLf -o $lfile $url
    fi

    printf "  # %s\n" $url
    printf "  '%s': sha256:%s\n" $ver $(sha256sum $lfile | awk '{print $1}')
}

dl ${1:-3.3.14}
