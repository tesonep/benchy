set -e

[[ ! -z "$DEBUG" ]] && set -x

SCRIPT_DIR=$(dirname $(readlink -f $0))

VMS_SCRIPT_DIR=$SCRIPT_DIR/VMs
IMAGES_SCRIPT_DIR=$SCRIPT_DIR/images

BUILD_DIR=${BUILD_DIR:=$SCRIPT_DIR/_build}

BUILD_VMS_DIR=$BUILD_DIR/VMs
BUILD_IMAGES_DIR=$BUILD_DIR/images

echo "Script root directory: $SCRIPT_DIR"
echo "VMS Script root directory: $VMS_SCRIPT_DIR"
echo "Build directory: $BUILD_DIR"
