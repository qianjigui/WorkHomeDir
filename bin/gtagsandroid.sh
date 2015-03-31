#!/bin/bash

SCAN_DIRS='libcore frameworks system'

GTAG_LIST_FILES=/tmp/GTAGS.FILES

rm $GTAG_LIST_FILES

for d in $SCAN_DIRS
do
    echo "Find files @ $d"
    find $d -type f -print >> $GTAG_LIST_FILES
done

echo "Generate gtags"
gtags -f $GTAG_LIST_FILES
echo "Please update gtags by: global -u"

