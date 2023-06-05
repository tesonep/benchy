#!/usr/bin/env bash
# Bash3 Boilerplate. Copyright (c) 2014, kvz.io

set -o errexit
set -o pipefail
set -o nounset
# set -o xtrace

# Set current file directory for relative access
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source ${__dir}/"environment.inc"

# Delete existing VMs
delete_vms () {
	rm -rf $BUILD_VMS_DIR
}

basename(){
	FILEPATH=$0
	FULLNAME="${FILEPATH##*/}"
	echo ${FULLNAME%.*}
}

export -f basename
VMS_NAMES=$(find $VMS_SCRIPT_DIR -iname "*.sh" | xargs -n1 bash -c 'basename -s .sh' )

# Build VMs
for vm in $VMS_NAMES; do
	if [ ! -d "$BUILD_VMS_DIR/$vm" ]; then
		echo "Building VM $vm"
		bash $VMS_SCRIPT_DIR/$vm.sh $VMS_SCRIPT_DIR $BUILD_VMS_DIR $BUILD_REPOS_DIR
	fi
done