#!/bin/bash

source "environment.inc"

DATE=$(date +%Y-%m-%d)
BENCHES_NAMES=$(find $BENCHES_SCRIPT_DIR -iname "*.sh" | xargs basename -s .sh)

for bench in $BENCHES_NAMES
do
	rscript $SCRIPT_DIR/plots/generatePlots.R $DATE $bench $BUILD_DIR
done