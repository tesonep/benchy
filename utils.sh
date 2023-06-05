#!/usr/bin/env bash

source environment.inc

benchy_log() {
	printf "benchy LOG: $*"
}

benchy_err(){
    echo "benchy ERROR: $*" >>/dev/stderr
}

results_not_empty () {
	[[ -z "$(find "${BUILD_RESULTS_DIR}" -maxdepth 0 -type d -empty 2>/dev/null)" ]]
	return $?
}

list_benchmarks () {
    find benchs/ -iname '*.sh' -exec sh -c 'for f do basename -- "$f" .sh; done' sh {} +
}

print_examples () {
	cat << EOF
benchy is a framework for doing benchmarks in Pharo

EOF

cat << EOF

To list the available benchmarks
$0 list

To run specific benchmarks in all images and all VMs
$0 bench slopstone
$0 bench richards

To plot existing results
$0 bench plot
EOF
}

print_help () {
	cat << EOF
benchy is a framework for doing benchmarks in Pharo

EOF

cat << EOF

The options include:
	clean 			Remove all benchmark results from results directory.
	plot			Plot benchmark results.
	examples		Show usage examples.
	download_images Download images specified in ${BUILD_IMAGES_DIR}.
	delete_images	Remove images specified in ${BUILD_IMAGES_DIR}.
	list			List available Pharo benchmarks.
	run			Run a Pharo Image.

Benchy project home page: https://github.com/tesonep/benchy
This software is licensed under the MIT License.
EOF
}

remove_results () {
    [ ! -d ${BUILD_RESULTS_DIR} ] && { benchy_log "No results directory found\n"; exit 1; }
    # Remove results directory contents
    benchy_log "Removing existing results from ${BUILD_RESULTS_DIR}\n"
	if ! results_not_empty; then
		 benchy_err "Results directory is empty"
		 exit 1
	else
		[[ -d ${BUILD_RESULTS_DIR} ]] && results_not_empty && rm ${BUILD_RESULTS_DIR}/* && benchy_log "Results successfully cleaned\n"
	fi
}
