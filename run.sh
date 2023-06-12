#!/usr/bin/env bash

# Fail fast and be aware of exit codes
set -eo pipefail

source "${BASH_SOURCE%/*}"/utils.sh

bench () {
    ${__dir}/runBenchs.sh "$2"
}

generate_plots () {
	${__dir}/generatePlots.sh
}

download_images () {
    benchy_log "Start downloading images"
    ${__dir}/downloadImages.sh
    benchy_log "Finished downloading images"
}

generate_config () {
	jsonnet config_templates/base.jsonnet'
}

parse_cmd_line () {
	case "$1" in
		clean )
    		remove_results
			;;	
		plot )
            generate_plots
			;;
		examples )
			print_examples && exit 0
			;;
		download_images )
			download_images
			;;
		delete_images )
			delete_images
			;;
		delete_vms )
			delete_vms
			;;
        bench )
            bench ${@}
            ;;
		list )
			list_benchmarks
			;;
		* )
			print_help
			exit 1
	esac
}

main () {
    [ $# -eq 0 ] && { print_help; exit 1; }
    parse_cmd_line ${@}
}

main ${@}
