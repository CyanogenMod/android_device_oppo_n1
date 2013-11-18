#!/bin/bash

VENDOR=oppo
DEVICE=n1

BASE=../../../vendor/$VENDOR/$DEVICE/proprietary
rm -rf $BASE/*

for FILE in `egrep -v '(^#|^$)' proprietary-files.txt`; do
    OLDIFS=$IFS IFS=":" PARSING_ARRAY=($FILE) IFS=$OLDIFS
    FILE=${PARSING_ARRAY[0]}
    DEST=${PARSING_ARRAY[1]}
    if [ -z $DEST ]
    then
        DEST=$FILE
    fi
    DIR=`dirname $FILE`
    if [ ! -d $BASE/$DIR ]; then
        mkdir -p $BASE/$DIR
    fi
    adb pull /system/$DEST $BASE/$FILE
    # if file does not exist try fallback
    if [ "$?" != "0" ]
    then
        adb pull /system/$FILE $BASE/$DEST
    fi
done
