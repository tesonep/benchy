#!/bin/bash

# This benchmark is used in fourCallsErrorTest.sh.

IMAGES="Pharo11"
VMs="latest10"
ITERATION=1

# Command that fails
PHARO_CMD="nil"

runBenchs

# Commands that succeeds
PHARO_CMD="eval 1+1"

runBenchs

PHARO_CMD="nil"

runBenchs

PHARO_CMD="eval 1+1"

runBenchs