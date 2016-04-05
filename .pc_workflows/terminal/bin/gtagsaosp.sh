#!/bin/bash

source $PCWF/bootstraps.sh

SCAN_DIRS='abi art bionic bootable build dalvik device external frameworks hardware libcore libnativehelper packages system'

GTAG_LIST_FILES=/tmp/GTAGS.FILES

rm $GTAG_LIST_FILES

for d in $SCAN_DIRS
do
    echo "Find files @ $d"
    find $d -type f >> $GTAG_LIST_FILES
done

echo "Generate gtags"
gtags -f $GTAG_LIST_FILES
echo "Please update gtags by: global -u"

