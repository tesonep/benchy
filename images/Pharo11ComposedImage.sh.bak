#!/bin/bash

source "$1/images.inc"

downloadImage https://files.pharo.org/image/110/stable-64.zip oldFormat

echo "Converting the image to the new format"

mkdir -p $BUILD_IMAGES_DIR/$NAME/converter

pushd $BUILD_IMAGES_DIR/$NAME/converter > /dev/null

wget -O - get.pharo.org/vm110 | bash
wget https://ci.inria.fr/pharo-ci-jenkins2/job/pharo-vm/view/change-requests/job/PR-488/lastBuild/artifact/VMMaker-Image.zip
unzip VMMaker-Image.zip

echo "VMSpurImageToComposedImageMigrationProcess new
    migrate: '$BUILD_IMAGES_DIR/$NAME/oldFormat.image' to: '$BUILD_IMAGES_DIR/$NAME/$NAME.image'" > script.st

./pharo image/VMMaker.image st --quit script.st

popd  > /dev/null
