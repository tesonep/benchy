#!/usr/bin/env bash
# Bash3 Boilerplate. Copyright (c) 2014, kvz.io

set -o errexit
set -o pipefail
set -o nounset
# set -o xtrace

# Set current file directory for relative access
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source ${__dir}/"utils.sh"
source ${__dir}/"environment.inc"

basename(){
	FILEPATH=$0
	FULLNAME="${FILEPATH##*/}"
	echo ${FULLNAME%.*}
}

# Delete existing Images
delete_images () {
	rm -rf $BUILD_IMAGES_DIR
	benchy_log "Images deleted successfully\n"
}


export -f basename
IMAGES_NAMES=$(find $IMAGES_SCRIPT_DIR -iname "*.sh" | xargs -n1 bash -c 'basename -s .sh' )

# Lazy downloading of images, if image already exists, do not download again
download_pharo_images () {
	benchy_log "Downloading pharo images\n"
	for image in $IMAGES_NAMES; do
		if [ ! -d "$BUILD_IMAGES_DIR/$image" ]; then
			benchy_log "Downloading image %s\n" $image
			bash $IMAGES_SCRIPT_DIR/$image.sh $IMAGES_SCRIPT_DIR $BUILD_IMAGES_DIR
		else
			benchy_log  "$image" "Image already downloaded\n"
		fi
	done
}

download_pharo_images