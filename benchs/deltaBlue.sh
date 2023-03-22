#!/bin/bash

IMAGES="Pharo11SMark"
VMs="latest9 latest10 druid druidMirror stack jitZero"
PHARO_CMD="eval SMarkDeltaBlue run: 100"

source "$1/bench.inc"

IMAGES="Pharo11ComposedImageSMark"
VMs="newImageFormat"

source "$1/bench.inc"