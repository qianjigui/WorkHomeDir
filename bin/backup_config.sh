#!/bin/bash


if [ ! $# -eq 1 ];
then
    cat<<END
    Usage: $0 HOME-DIR
END
    exit 1
fi

DIR=$1

cd $DIR

DIR_LIST=.ssh .netrc download
tar -pcvf NO_GIT.tar $DIR_LIST

