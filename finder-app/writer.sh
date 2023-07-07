#!/usr/bin/bash

WRITE_FILE=$1
WRITE_STR=$2

if [ ! $# -eq 2 ]
then
    echo "usage: $0 <write_file> <write_str>"
    exit 1
fi

DIR=$(dirname $WRITE_FILE)
if [ ! -d $DIR ]
then
    mkdir -p $DIR
fi

echo $WRITE_STR > $WRITE_FILE
