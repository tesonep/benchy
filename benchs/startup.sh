#!/bin/bash

IMAGES="Pharo10 Pharo11"
VMs="latest9 latest10 druid stack"
PHARO_CMD="eval 1+1"

runBenchs

IMAGES="Pharo11ComposedImage"
VMs="newImageFormat"

runBenchs