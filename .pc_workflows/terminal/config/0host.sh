NAME=$(hostname)

FILE=$PCWF/terminal/config/host/$NAME.sh
if [ -f $FILE ]; then
    echo "Load $NAME"
    source $FILE
fi

printlocalenv() {
    cat $FILE | grep export
}
