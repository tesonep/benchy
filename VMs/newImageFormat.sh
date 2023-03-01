#!/bin/bash

source "$1/VMs.inc"

downloadVM https://ci.inria.fr/pharo-ci-jenkins2/job/pharo-vm/view/change-requests/job/PR-488/lastBuild/artifact/artifacts-Darwin-arm64-ComposedFormat/PharoVM-10.0.0-004769e38-$OS-$ARCH-bin.zip
