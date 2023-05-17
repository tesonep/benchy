#!/bin/bash

IMAGES="Pharo11"
VMs="latest10"
ITERATIONS=4
PHARO_CMD='eval ($ITERATION \\ 2) == 0 ifFalse: [ self error ]'

runBenchs