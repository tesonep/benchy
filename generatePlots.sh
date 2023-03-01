#!/usr/bin/env bash
# Bash3 Boilerplate. Copyright (c) 2014, kvz.io

set -o errexit
set -o pipefail
set -o nounset
# set -o xtrace

# Set current file directory for relative access
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source ${__dir}/"environment.inc"

#Run the bench as argument, or all if argument is absent
BENCHES_NAMES=$(find $BENCHES_SCRIPT_DIR -iname "*.sh" | xargs basename -s .sh)
BENCHES_NAMES=${1-$BENCHES_NAMES}

for bench in $BENCHES_NAMES
do
	rscript ${__dir}/plots/generatePlots.R $DATE $bench $BUILD_DIR
done

#Generate historical data

rscript ${__dir}/plots/generateHistoricalPlot.R 30 richards 'Pharo11SMark-latest9 Pharo11SMark-latest10 Pharo11ComposedImageSMark-newImageFormat' $BUILD_DIR
rscript ${__dir}/plots/generateHistoricalPlot.R 30 deltaBlue "Pharo11SMark-latest9 Pharo11SMark-latest10 Pharo11ComposedImageSMark-newImageFormat" $BUILD_DIR
rscript ${__dir}/plots/generateHistoricalPlot.R 30 slopstone "Pharo11SMark-latest9 Pharo11SMark-latest10 Pharo11ComposedImageSMark-newImageFormat" $BUILD_DIR
