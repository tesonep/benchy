#!/bin/bash

set -e 
set -x

./downloadImages.sh
./downloadVMs.sh
./runBenchs.sh
./generatePlots.sh