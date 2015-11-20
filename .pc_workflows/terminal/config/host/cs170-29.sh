BIN=/OpenbaseBSPHome/bins


for item in android-ndk-r10c ruby2.1.2/bin vim/bin global6.4/bin
do
    if [ -d $BIN/$itme ];
    then
        PATH=$BIN/$item:$PATH
    fi
done

#For global
export GTAGSLABEL=pygments

#java
_TMP=$BIN/jdk1.6.0_35
if [ -d $_TMP ];
then
    export JAVA_HOME=$_TMP
fi

#Android
_TMP=$BIN/android-sdk-linux
if [ -d $_TMP ];
then
    export ANDROID_SDK_DIR=$_TMP
fi

#golang
_TMP=$BIN/go1.5.0
if [ -d $_TMP ];
then
    export GOROOT=$_TMP
fi

#For Android ccache
export USE_CCACHE=1
export CCACHE_DIR=$HOME/disk2/data/CCache/

#Env
export RWPC="$HOME"
export  A20="$RWPC/projs/tvs/Openbase/A20/2.xUserDebug"
export  A31="$RWPC/projs/tvs/Openbase/A31S4.4/YOS2/EngVersion"
export    L="$RWPC/projs/tvs/Openbase/rockchip/L"
export   SL="$RWPC/work/seyunos"
export   PT="$RWPC/work/Porting/yunos_porting_doc"
export   AD="$RWPC/work/adwords"

export SelfDoc="$HOME/study/workdocuments"
export DL="$HOME/download"
