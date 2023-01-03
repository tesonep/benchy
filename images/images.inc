ARCH=$(uname -m)
OS=$(uname -s)
BUILD_IMAGES_DIR=$2
FULLNAME=$(basename $0)
NAME=${FULLNAME%%.*}

function downloadImage(){
	
	URL=$1
	
	mkdir -p $BUILD_IMAGES_DIR/$NAME

	pushd $BUILD_IMAGES_DIR/$NAME
	wget $URL -O downloadedImage.zip
	unzip downloadedImage.zip
	
	ORIGINAL_IMAGE_NAME=$(find . -iname "*.image")
	ORIGINAL_CHANGES_NAME=$(find . -iname "*.changes")
	
	mv $ORIGINAL_IMAGE_NAME $NAME.image
	mv $ORIGINAL_CHANGES_NAME $NAME.changes
	
	popd
}
