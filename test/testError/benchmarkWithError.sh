#!/bin/bash

IMAGES="Pharo11"
VMs="latest10"
ITERATIONS=4
# CMD_START="eval ("
# CMD_END=" \\\\ 2) == 0 ifFalse: [ self error ]"
CMD="eval (ITERATION \\\\ 2) == 0 ifFalse: [ self error ]"

runBenchs