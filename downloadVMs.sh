#!/usr/bin/env bash
# Bash3 Boilerplate. Copyright (c) 2014, kvz.io

set -o errexit
set -o pipefail
set -o nounset
# set -o xtrace

# Set current file directory for relative access
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source ${__dir}/"environment.inc"

#Delete existing VMs
rm -rf $BUILD_VMS_DIR

VMS_NAMES=$(find $VMS_SCRIPT_DIR -iname "*.sh" | xargs basename -s .sh)

for vm in $VMS_NAMES
do
	echo "Downloading VM $vm"
	bash $VMS_SCRIPT_DIR/$vm.sh $VMS_SCRIPT_DIR $BUILD_VMS_DIR
done