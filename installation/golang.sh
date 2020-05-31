#!/bin/bash

# Script based on https://github.com/canha/golang-tools-install-script/blob/master/goinstall.sh
VERSION="1.14"

VAGRANT_HOME="/home/vagrant"

[ -z "$GOROOT" ] && GOROOT="$VAGRANT_HOME/.go"
[ -z "$GOPATH" ] && GOPATH="$VAGRANT_HOME/go"

PLATFORM="linux-amd64"
PACKAGE_NAME="go$VERSION.$PLATFORM.tar.gz"
TEMP_DIRECTORY=$(mktemp -d)
shell_profile="bashrc"

wget https://storage.googleapis.com/golang/$PACKAGE_NAME -O "$TEMP_DIRECTORY/go.tar.gz"

if [ $? -ne 0 ]; then
    echo "Download failed! Exiting."
    exit 1
fi

echo "Extracting File..."
mkdir -p "$GOROOT"
tar -C "$GOROOT" --strip-components=1 -xzf "$TEMP_DIRECTORY/go.tar.gz"
touch "$VAGRANT_HOME/.${shell_profile}"
{
    echo '# GoLang'
    echo "export GOROOT=${GOROOT}"
    echo 'export PATH=$GOROOT/bin:$PATH'
    echo "export GOPATH=$GOPATH"
    echo 'export PATH=$GOPATH/bin:$PATH'
} >> "$VAGRANT_HOME.${shell_profile}"

mkdir -p $GOPATH/{src,pkg,bin}
echo -e "\nGo $VERSION was installed into $GOROOT.\nMake sure to relogin into your shell or run:"
echo -e "\n\tsource $VAGRANT_HOME/.${shell_profile}\n\nto update your environment variables."
echo "Tip: Opening a new terminal window usually just works. :)"
rm -f "$TEMP_DIRECTORY/go.tar.gz"
