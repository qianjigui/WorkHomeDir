

pcwf_cd() {
    _DIR=$1
    if [ -f $_DIR ]
    then
        _DIR=$(dirname $_DIR)
    fi
    cd $_DIR
}

