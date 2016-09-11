#http://apple.stackexchange.com/a/127405/183620
#sudo scutil --set HostName Mac.local
#

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

#golang
_TMP=/usr/local/vim74
if [ -d $_TMP ];
then
    export LOCALVIM=$_TMP
fi

#markdown2html
_TMP=$PCWF/terminal/cmd/script/Markdown2html
if [ -d $_TMP ];
then
    export MD2HTML=$_TMP
fi

#Env
export RWPC='/SSHFS/pengcheng.wang'
export  A20="$RWPC/projs/tvs/Openbase/A20/2.xUserDebug"
export  A31="$RWPC/disk1/projs/tvs/Openbase/A31S4.4/YOS2/Dev/Build"
export    L="$RWPC/projs/tvs/Openbase/rockchip/L"
export   SL="$RWPC/work/seyunos"
export   PT="$RWPC/work/Porting/yunos_porting_doc"
export   AD="$RWPC/work/adwords"
export  MPC="$RWPC/work/MicroPC/BMWDev"

export SelfDoc="$HOME/workspace/work/SelfDoc"
export DL="$HOME/Downloads"
export MPCP="$HOME//workspace/work/micropcporting"

