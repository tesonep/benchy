#!/bin/bash

set -e 
set -x

export DATE=${1:-$(date +%Y-%m-%d)}

./downloadImages.sh
./downloadVMs.sh
./runBenchs.sh
./generatePlots.sh