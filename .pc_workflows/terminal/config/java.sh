
if [ $JAVA_HOME ];
then
    echo 'Add Java'
    export PATH=$JAVA_HOME/bin:$PATH
fi

java7set() {
    JAVA_7_HOME=/usr/lib/jvm/java-7-openjdk-amd64
    if [ -d $JAVA_7_HOME ];
    then
        echo 'To Java 7'
        export JAVA_HOME=$JAVA_7_HOME
        export PATH=$JAVA_HOME/bin:$PATH
    fi
}
