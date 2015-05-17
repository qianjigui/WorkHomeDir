for file in $(ls $PCWF/terminal/cmd/*.sh | sort | uniq )
do
    source $file
done

for file in $(ls $PCWF/terminal/config/*.sh | sort | uniq)
do
    source $file
done
