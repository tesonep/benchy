#!/usr/bin/env bash

# Set current file directory for relative access
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Before any test, this command is executed
oneTimeSetUp() {
    ${__dir}/../downloadImages.sh
    ${__dir}/../buildVMs.sh
    ITERATIONS=1 DATE=aDate ${__dir}/../runBenchs.sh slopstone
}

# After all tests, the results files are removed
oneTimeTearDown() {
    rm -rf ./_build/results
}

# Tests without benchmarks directory parameter. The tests don't check if every files exist after the command, they only check a few of them. It can be assumed that if they do exist, all exist.
testNoParamSmarkCompilerSlopstoneLatest10() {
    assertTrue "[ -f ./_build/results/slopstone-Pharo11SMark-latest10/slopstone-Pharo11SMark-latest10-aDate.csv ]"
}

testNoParamSmarkCompilerLatest9() {
    assertTrue "[ -f ./_build/results/slopstone-Pharo11SMark-latest9/slopstone-Pharo11SMark-latest9-aDate.csv ]"
}

testNoParamSmarkCompilerDruid() {
    assertTrue "[ -f ./_build/results/slopstone-Pharo11SMark-druid/slopstone-Pharo11SMark-druid-aDate.csv ]"
}

testNoParamSmarkCompileriJitZero() {
    assertTrue "[ -f ./_build/results/slopstone-Pharo11SMark-jitZero/slopstone-Pharo11SMark-jitZero-aDate.csv ]"
}

testNoParamSmarkCompilerStack() {
    assertTrue "[ -f ./_build/results/slopstone-Pharo11SMark-stack/slopstone-Pharo11SMark-stack-aDate.csv ]"
}

# Load shUnit2.
. shunit2