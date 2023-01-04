#!/bin/bash

source "$1/images.inc"

downloadImage https://files.pharo.org/image/110/stable-64.zip

mkdir -p $BUILD_IMAGES_DIR/$NAME/vm

pushd $BUILD_IMAGES_DIR/$NAME/vm > /dev/null

wget -O - get.pharo.org/vm110 | bash

echo "Metacello new
		baseline: 'SMark';
		repository: 'github://guillep/SMark';
		load." > script.st

./pharo ../$NAME.image st --quit --save script.st

popd  > /dev/null
