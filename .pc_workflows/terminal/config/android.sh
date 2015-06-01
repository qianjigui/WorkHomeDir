if [ -n $ANDROID_SDK_DIR ];
then
    ANDROID_PLATFORM_TOOLS=$ANDROID_SDK_DIR/platform-tools
    ANDROID_BUILD_TOOLS=$ANDROID_SDK_DIR/build-tools
    if [ -d $ANDROID_PLATFORM_TOOLS ]; then
        echo "Add Android SDK platform tools"
        export PATH=$ANDROID_PLATFORM_TOOLS:$PATH
    fi

    if [ -d $ANDROID_BUILD_TOOLS ]; then
        ANDROID_BUILD_TOOLS_LATEST_VERSION=$(ls $ANDROID_BUILD_TOOLS/ | sort | tail -1)
        ANDROID_BUILD_TOOLS=$ANDROID_BUILD_TOOLS/$ANDROID_BUILD_TOOLS_LATEST_VERSION
        if [ -d $ANDROID_BUILD_TOOLS ]; then
            echo "Add Android SDK Build tools"
            export PATH=$ANDROID_BUILD_TOOLS:$PATH
        fi
    fi
fi

