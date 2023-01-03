#!/bin/bash

source "environment.inc"

BENCHES_NAMES=$(find $BENCHES_SCRIPT_DIR -iname "*.sh" | xargs basename -s .sh)

for bench in $BENCHES_NAMES
do
	bash $BENCHES_SCRIPT_DIR/$bench.sh $BENCHES_SCRIPT_DIR $BUILD_VMS_DIR $BUILD_IMAGES_DIR $BUILD_RESULTS_DIR

done