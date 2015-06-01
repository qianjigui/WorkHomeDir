
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

