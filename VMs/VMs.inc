#!/usr/bin/env bash
# Bash3 Boilerplate. Copyright (c) 2014, kvz.io

set -o errexit
set -o pipefail
set -o nounset
# set -o xtrace

# Set current file directory for relative access
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ARCH=$(uname -m)
OS=$(uname -s)
BUILD_VMS_DIR=$2
BUILD_REPOS_DIR=$3
FULLNAME=$(basename $0)
NAME=${FULLNAME%%.*}

if [ "$OS" == "Darwin" ]; then
	VM_CMD="Pharo.app/Contents/MacOS/Pharo"
fi

if [ "$OS" == "Linux" ]; then
	VM_CMD="pharo"
fi

function downloadVM(){
	
	URL=$1
	
	mkdir -p $BUILD_VMS_DIR/$NAME

	echo "Downloading VM $NAME"

	pushd $BUILD_VMS_DIR/$NAME > /dev/null
	wget $URL -O downloadedVM.zip
	unzip downloadedVM.zip
	popd > /dev/null
}

PHAROVM_REPO_URI="https://github.com/pharo-project/pharo-vm.git"
PHAROVM_REPO_DIR=$BUILD_REPOS_DIR/pharo-vm

function updateVMRepo() {
	BRANCH=${1:-master}
	if [ -d $PHAROVM_REPO_DIR ] 
	then
		cd $PHAROVM_REPO_DIR
		git checkout $BRANCH
		git pull
	else
		[ ! -d $BUILD_REPOS_DIR ] && mkdir $BUILD_REPOS_DIR
		cd $BUILD_REPOS_DIR && git clone --branch $BRANCH $PHAROVM_REPO_URI
	fi
}

function buildVM() {
	FLAVOUR=${1:-JITVM}

	echo "Building VM $NAME with $FLAVOUR"

	cmake -DFLAVOUR=$FLAVOUR -S $PHAROVM_REPO_DIR -B $BUILD_VMS_DIR/$NAME/build -DPHARO_DEPENDENCIES_PREFER_DOWNLOAD_BINARIES=TRUE
    cmake --build $BUILD_VMS_DIR/$NAME/build --target install
    cp -R $BUILD_VMS_DIR/$NAME/build/build/dist/* $BUILD_VMS_DIR/$NAME
}