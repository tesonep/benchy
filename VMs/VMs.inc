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
