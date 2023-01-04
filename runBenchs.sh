#!/bin/bash

source "environment.inc"

DATE=$(date +%Y-%m-%d)
BENCHES_NAMES=$(find $BENCHES_SCRIPT_DIR -iname "*.sh" | xargs basename -s .sh)

#If the first parameter is passed is the name of the bench to run
if [ ! -z "$1" ]
then
	BENCHES_NAMES="$1"
fi

for bench in $BENCHES_NAMES
do
	bash $BENCHES_SCRIPT_DIR/$bench.sh $BENCHES_SCRIPT_DIR $BUILD_VMS_DIR $BUILD_IMAGES_DIR $BUILD_RESULTS_DIR $DATE
done