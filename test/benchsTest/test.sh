#!/bin/bash

IMAGES="Pharo11"
VMs="latest9"
PHARO_CMD="eval 1+1"

runBenchs

IMAGES="Pharo10"
VMs="latest10"

runBenchs