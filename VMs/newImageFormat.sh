#!/bin/bash

source "$1/VMs.inc"

downloadVM https://ci.inria.fr/pharo-ci-jenkins2/job/pharo-vm/view/change-requests/job/PR-488/lastBuild/artifact/artifacts-$OS-$ARCH-ComposedFormat/PharoVM-10.0.0-acb80ea-$OS-$ARCH-bin.zip
