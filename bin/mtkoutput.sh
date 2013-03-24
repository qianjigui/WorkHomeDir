#!/bin/bash

if [ $# != 2 ]
then
    echo "$0 image_dir output_dir"
    exit 1
fi

IMG_DIR=$1
OUT_DIR=$2

mkdir $OUT_DIR

cd $IMG_DIR
for i in `ls -l | grep ^[^d] | awk '{print $8}'`
do
    echo $i
    cp -L $i $OUT_DIR/
done
