#!/usr/bin/bash

FILES_DIR=$1
SEARCH_STR=$2

if [ $# -lt 2 ]
then
    echo "usage: $0 <files_dir> <search_str>"
    exit 1
fi

if [ ! -d $FILES_DIR ]
then
    echo "$FILES_DIR is not a valid directory"
    exit 1
fi

let MATCHES=0
for file in $( find $FILES_DIR )
do
    if grep -wq $SEARCH_STR $file 2> /dev/null
    then
        let MATCHES++
    fi
done

NUM_FILE=$( find $FILES_DIR -type f | wc -l )
echo "The number of files are $NUM_FILE and the number of matching lines are $MATCHES"
