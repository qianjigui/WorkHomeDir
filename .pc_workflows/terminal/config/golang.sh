MAC_GO_ROOT=/usr/local/go
if [ -d $MAC_GO_ROOT ]; then
    echo "Add golang"
    export PATH=$PATH:$MAC_GO_ROOT/bin
    export GOROOT=$MAC_GO_ROOT
fi

