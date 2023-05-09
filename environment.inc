#!/usr/bin/env bash
# Bash3 Boilerplate. Copyright (c) 2014, kvz.io

set -o errexit
set -o pipefail
set -o nounset
# set -o xtrace

# Set current file directory for relative access
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"



VMS_SCRIPT_DIR=${__dir}/VMs
IMAGES_SCRIPT_DIR=${__dir}/images

#Get the absolute build dir, so scripts can move around and change the working directory
BUILD_DIR=${BUILD_DIR:=`pwd`/_build}

BUILD_VMS_DIR=$BUILD_DIR/VMs
BUILD_REPOS_DIR=$BUILD_DIR/repos
BUILD_IMAGES_DIR=$BUILD_DIR/images
BUILD_RESULTS_DIR=$BUILD_DIR/results

DATE=${DATE:=$(date +%Y-%m-%d)}

ARCH=$(uname -m)
OS=$(uname -s)

echo "Script root directory: ${__dir}"
echo "VMS Script root directory: $VMS_SCRIPT_DIR"
echo "Build directory: $BUILD_DIR"
echo "Date to build:" $DATE