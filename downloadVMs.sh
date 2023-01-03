#!/bin/bash

source "environment.inc"

#Delete existing VMs
rm -rf $BUILD_VMS_DIR

VMS_NAMES=$(find $VMS_SCRIPT_DIR -iname "*.sh" | xargs basename -s .sh)

for vm in $VMS_NAMES
do
	echo "Downloading VM $vm"
	bash $VMS_SCRIPT_DIR/$vm.sh $VMS_SCRIPT_DIR $BUILD_VMS_DIR
done