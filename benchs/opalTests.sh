#!/bin/bash

IMAGES="Pharo10 Pharo11"
VMs="latest9 latest10 druid druidMirror stack"
PHARO_CMD="test Opal.* AST.*"

source "$1/bench.inc"

IMAGES="Pharo11ComposedImage"
VMs="newImageFormat"

source "$1/bench.inc"
