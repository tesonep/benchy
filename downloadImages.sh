#!/bin/bash

source "environment.inc"

#Delete existing Images

rm -rf $BUILD_IMAGES_DIR

IMAGES_NAMES=$(find $IMAGES_SCRIPT_DIR -iname "*.sh" | xargs basename -s .sh)

for image in $IMAGES_NAMES
do
	echo "Downloading Images $image"
	bash $IMAGES_SCRIPT_DIR/$image.sh $IMAGES_SCRIPT_DIR $BUILD_IMAGES_DIR
done