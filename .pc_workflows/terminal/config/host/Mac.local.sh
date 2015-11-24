
#java
_TMP=/Library/Java/JavaVirtualMachines/jdk1.8.0_40.jdk/Contents/Home/
if [ -d $_TMP ];
then
    export JAVA_HOME=$_TMP
fi

#Android
_TMP=$HOME/Library/Android/sdk
if [ -d $_TMP ];
then
    export ANDROID_SDK_DIR=$_TMP
fi

#golang
_TMP=/usr/local/go
if [ -d $_TMP ];
then
    export GOROOT=$_TMP
fi

#Env
export RWPC='/SSHFS/pengcheng.wang'
export  A20="$RWPC/projs/tvs/Openbase/A20/2.xUserDebug"
export  A31="$RWPC/projs/tvs/Openbase/A31S4.4/YOS2/EngVersion"
export    L="$RWPC/projs/tvs/Openbase/rockchip/L"
export   SL="$RWPC/work/seyunos"
export   PT="$RWPC/work/Porting/yunos_porting_doc"
export   AD="$RWPC/work/adwords"

export SelfDoc="$HOME/workspace/work/SelfDoc"
export DL="$HOME/Downloads"