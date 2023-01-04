#!/bin/bash

set -x

source "environment.inc"

DATE=$(date +%Y-%m-%d)
BENCHES_NAMES=$(find $BENCHES_SCRIPT_DIR -iname "*.sh" | xargs basename -s .sh)

#If the first parameter is passed is the name of the bench to generate
if [ ! -z "$1" ]
then
	BENCHES_NAMES="$1"
fi

for bench in $BENCHES_NAMES
do
	rscript $SCRIPT_DIR/plots/generatePlots.R $DATE $bench $BUILD_DIR
done