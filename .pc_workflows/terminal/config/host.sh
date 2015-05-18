NAME=$(hostname)

FILE=$PCWF/terminal/config/host/$NAME.sh
if [ -f $FILE ]; then
    source $FILE
fi
