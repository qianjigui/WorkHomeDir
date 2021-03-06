#!/bin/bash

source $PCWF/bootstraps.sh

SCAN_DIRS='custom libcore frameworks system device yunos build'

GTAG_LIST_FILES=/tmp/GTAGS.yunos.FILES

rm $GTAG_LIST_FILES

for d in $SCAN_DIRS
do
    echo "Find files @ $d"
    pcwf_findsrc $d >> $GTAG_LIST_FILES
done

echo "Generate gtags"
gtags -f $GTAG_LIST_FILES
echo "Please update gtags by: global -u"

