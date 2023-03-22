#!/usr/bin/env bash
# Bash3 Boilerplate. Copyright (c) 2014, kvz.io

set -o errexit
set -o pipefail
set -o nounset
# set -o xtrace

# Set current file directory for relative access
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source ${__dir}/"environment.inc"

#Delete existing Images
rm -rf $BUILD_IMAGES_DIR

IMAGES_NAMES=$(find $IMAGES_SCRIPT_DIR -iname "*.sh" | xargs basename -s .sh)

for image in $IMAGES_NAMES
do
	echo "Downloading image $image"
	bash $IMAGES_SCRIPT_DIR/$image.sh $IMAGES_SCRIPT_DIR $BUILD_IMAGES_DIR
done