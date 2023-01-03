#!/bin/bash

IMAGES="Pharo10 Pharo11"
VMs="latest latest10"
PHARO_CMD="test Opal.* AST.*"

source "$1/bench.inc"