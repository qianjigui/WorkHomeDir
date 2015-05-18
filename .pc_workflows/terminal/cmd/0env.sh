
if [ $ZSH ];
then
    export PCWF_IS_ZSH='true'
else
    export PCWF_IS_ZSH=''
fi

case "$(uname -s)" in

    Darwin)
        echo 'Mac OS X'
        export PCWF_IS_MACOSX='true'
        ;;

    Linux)
        echo 'Linux'
        export PCWF_IS_LINUX='true'
        ;;

    CYGWIN*|MINGW32*|MSYS*)
        echo 'MS Windows'
        export PCWF_IS_WINDOWS='true'
        ;;

    *)
        echo 'other OS (or missing cases for above OSs)' 
        ;;
esac

pcwf_info() {
    echo "[PCFW] $*"
}

pcwf_cmd() {
    type $1 > /dev/null
    if [ $? -eq 0 ];
    then
        $*
    else
        pcwf_info "Ignore $*"
    fi
}

export PATH=$PATH:$PCWF/terminal/bin

