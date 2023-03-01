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
FULLNAME=$(basename $0)
NAME=${FULLNAME%%.*}

function downloadVM(){
	
	URL=$1
	
	mkdir -p $BUILD_VMS_DIR/$NAME

	pushd $BUILD_VMS_DIR/$NAME > /dev/null
	wget $URL -O downloadedVM.zip
	unzip downloadedVM.zip
	popd > /dev/null
}
