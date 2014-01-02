#!/bin/bash


if [ ! $# -eq 2 ];
then
    cat<<END
    Usage: $0 zip1 zip2
END
    exit 1
fi

FILE_LIST_NAME=filelist.txt.list
f1=$1
f2=$2

d1=${f1}-ext
d2=${f2}-ext

unzip -d ${d1} $f1
unzip -d ${d2} $f2

for i in $d1 $d2
do
    cd $i
    find . -type f -or -type d -or -type l | sort | uniq > $FILE_LIST_NAME
    cd -
done

comm -12 $d1/$FILE_LIST_NAME $d2/$FILE_LIST_NAME > same.list
comm -23 $d1/$FILE_LIST_NAME $d2/$FILE_LIST_NAME > list.$d1.list
comm -13 $d1/$FILE_LIST_NAME $d2/$FILE_LIST_NAME > list.$d2.list

for i in `cat same.list`
do
    if [ -f $d1/$i ];
    then
        LEFT=`sha1sum $d1/$i | awk '{print $1}'`
        RIGHT=`sha1sum $d2/$i | awk '{print $1}'`
        if [ ! $LEFT = $RIGHT ];
        then
            echo 'Diff: '$i;
        fi
    fi
done
