#!/bin/bash

IMAGES="Pharo11"
VMs="latest10"
PHARO_CMD="nil"

runBenchs

PHARO_CMD="eval 1+1"

runBenchs

PHARO_CMD="nil"

runBenchs

PHARO_CMD="eval 1+1"

runBenchs