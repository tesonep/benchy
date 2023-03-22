#!/usr/bin/env bash
# Bash3 Boilerplate. Copyright (c) 2014, kvz.io

set -o errexit
set -o pipefail
set -o nounset
# set -o xtrace

# Set current file directory for relative access
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"


export DATE=${1:-$(date +%Y-%m-%d)}

${__dir}/downloadImages.sh
${__dir}/buildVMs.sh
${__dir}/runBenchs.sh
${__dir}/generatePlots.sh