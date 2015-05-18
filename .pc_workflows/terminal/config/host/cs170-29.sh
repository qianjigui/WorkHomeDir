BIN=/OpenbaseBSPHome/bins


for item in android-ndk-r10c android-sdk-linux/tools ruby2.1.2/bin vim/bin android-sdk-linux/build-tools/21.0.2
do
    if [ -d $BIN/$itme ];
    then
        PATH=$BIN/$item:$PATH
    fi
done

export JAVA_HOME=$BIN/jdk1.6.0_35
export PATH=$JAVA_HOME/bin:$PATH


export GOROOT=$BIN/go1.4.2
export PATH=$GOROOT/bin:$PATH
