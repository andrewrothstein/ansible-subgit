#!/usr/bin/env sh
VER=${1:-3.3.8}
DIR=~/Downloads
FILE=subgit-${VER}.zip
URL=https://subgit.com/download/${FILE}
LFILE=$DIR/$FILE

if [ ! -e $LFILE ];
then
    wget -q -O $LFILE $URL
fi

printf "  # %s\n" $URL
printf "  '%s': sha256:%s\n" $VER $(sha256sum $LFILE | awk '{print $1}')
