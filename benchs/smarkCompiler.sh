#!/bin/bash

IMAGES="Pharo11SMark"
VMs="latest9 latest10 druid stack jitZero"
PHARO_CMD="eval SMarkCompiler run: 100"

runBenchs

IMAGES="Pharo11ComposedImageSMark"
VMs="newImageFormat"

runBenchs