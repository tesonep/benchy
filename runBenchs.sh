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

# Create CSV file if it does not exists and write header in line protocol format
# Each line represents a data point.
# 	Each data point requires a:
#    measurement
#    field set
#    (Optional) tag set
#    timestamp
createLineProtocolCSV() {
	if [ ! -f "$result_file" ]; then
		# Ensure results directory exists
		mkdir -p "$BUILD_RESULTS_DIR"
		echo "#datatype measurement,tag,double:.,tag,tag,tag,tag,tag,dateTime:RFC3339" > "$result_file"
		echo "benchmark,status,duration,req_iterations,image_name,vm_name,output_file,err_file,time" >> "$result_file"
	fi
}

export -f basename

#Run the bench as argument, or all if argument is absent
benchmark_names=$(find $BENCHES_SCRIPT_DIR -iname "*.sh" | xargs -n1 bash -c 'basename -s .sh' )
benchmark_names=${1-$benchmark_names}

# Warning: Do NOT rename any .inc to .sh in the benchmarks script directory 
# as the find command captures all the .sh scripts in the directory
iterateBenchmarks() {
	for bench in $benchmark_names
	do
		bash "$__dir/benchs/bench.inc" $BENCHES_SCRIPT_DIR $BUILD_VMS_DIR $BUILD_IMAGES_DIR $BUILD_RESULTS_DIR $DATE $BENCHES_SCRIPT_DIR/$bench.sh
	done
}

main () {
	createLineProtocolCSV
	iterateBenchmarks
}

main