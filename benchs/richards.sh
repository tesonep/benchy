#!/bin/bash

IMAGES="Pharo11SMark"
VMs="latest9 latest10"
PHARO_CMD="eval SMarkRichards run: 100"

runBenchs

IMAGES="Pharo11ComposedImageSMark"
VMs="newImageFormat"

runBenchs