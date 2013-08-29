#!/bin/bash

if [ $# != 2 ]
then
    echo "$0 image_dir output_dir"
    exit 1
fi

IMG_DIR=$1
OUT_DIR=$2

mkdir -p `dirname $OUT_DIR`

cd $IMG_DIR
NAME=$OUT_DIR`date +%Y%m%d%H%M%S`.tar.gz
ls -l | grep ^[^d] | awk '{print $8}' | tar czfhv $NAME -T -
#rm $OUT_DIR/$NAME
#mv $NAME $OUT_DIR/
