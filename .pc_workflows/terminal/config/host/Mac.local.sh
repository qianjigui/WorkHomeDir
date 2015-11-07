
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
export A20='/SSHFS/pengcheng.wang/projs/tvs/Openbase/A20/2.xUserDebug'
export A31='/SSHFS/pengcheng.wang/projs/tvs/Openbase/A31S4.4/YOS2/EngVersion'
export L='/SSHFS/pengcheng.wang/projs/tvs/Openbase/rockchip/L'
export SelfDoc="$HOME/workspace/work/SelfDoc"
export DL="$HOME/Downloads"
export SL='/SSHFS/pengcheng.wang/work/seyunos'
