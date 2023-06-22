#!/usr/bin/env bash
# Bash3 Boilerplate. Copyright (c) 2014, kvz.io

set -o errexit
set -o pipefail
set -o nounset
# set -o xtrace

# Set current file directory for relative access
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Defines the directory where the benchmarks configurations are, default is benchs folder
export BENCHES_SCRIPT_DIR=${BENCHES_SCRIPT_DIR:-$__dir/benchs}

source ${__dir}/"environment.inc"

# All measurement output is written in a single CSV file
# Define main output CSV file name
output_filename="benchy-runs.csv"
# Set the main output file path
export result_file="$BUILD_RESULTS_DIR"/"$output_filename"

basename(){
	local FILEPATH=$0
	local FULLNAME="${FILEPATH##*/}"
	echo ${FULLNAME%.*}
}

# Write CSV header in line protocol format
# Each line represents a data point.
# 	Each data point requires a:
#    measurement
#    field set
#    (Optional) tag set
#    timestamp
createLineProtocolCSV() {
	# Ensure results directory exists
	mkdir -p "$BUILD_RESULTS_DIR"
	echo "#datatype measurement,tag,double:.,tag,tag,tag,tag,tag,dateTime:RFC3339" > "$result_file"
	echo "benchmark,status,duration,req_iterations,image_name,vm_name,output_file,err_file,time" >> "$result_file"
}

export -f basename

#Run the bench as argument, or all if argument is absent
BENCHES_NAMES=$(find $BENCHES_SCRIPT_DIR -iname "*.sh" | xargs -n1 bash -c 'basename -s .sh' )
BENCHES_NAMES=${1-$BENCHES_NAMES}

# Warning: Do not rename any .inc to .sh in the benchmarks script directory 
# as the find command captures all the .sh scripts in the directory
main () {
	createLineProtocolCSV
	for bench in $BENCHES_NAMES
	do
		bash "$__dir/benchs/bench.inc" $BENCHES_SCRIPT_DIR $BUILD_VMS_DIR $BUILD_IMAGES_DIR $BUILD_RESULTS_DIR $DATE $BENCHES_SCRIPT_DIR/$bench.sh
	done
}

main