#!/bin/bash

IMAGES="Pharo10 Pharo11"
VMs="latest9 latest10"
PHARO_CMD="test Kernel.*"

runBenchs

IMAGES="Pharo11ComposedImage"
VMs="newImageFormat"

runBenchs