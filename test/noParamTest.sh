#!/usr/bin/env bash

# Before any test, this command is executed
oneTimeSetUp() {
    ITERATIONS=1 ./runAll.sh aDate
}

# After all tests, the results files are removed
oneTimeTearDown() {
    rm -rf ./_build/results
}

# Tests without benchmarks directory parameter. The tests don't check if every files exist after the command, they only check a few of them. It can be assumed that if they do exist, all exist.
testNoParamDeltaBlue() {
    assertTrue "[ -f ./_build/results/deltaBlue-Pharo11SMark-latest10/deltaBlue-Pharo11SMark-latest10-aDate.csv ]"
}

testNoParamFiles() {
    assertTrue "[ -f ./_build/results/files-Pharo10-druidMirror/files-Pharo10-druidMirror-aDate.csv ]"
}

testNoParamCompiler() {
    assertTrue "[ -f ./_build/results/smarkCompiler-Pharo11SMark-jitZero/smarkCompiler-Pharo11SMark-jitZero-aDate.csv ]"
}

testNoParamRichards() {
    assertTrue "[ -f ./_build/results/richards-Pharo11SMark-stack/richards-Pharo11SMark-stack-aDate.csv ]"
}

# Load shUnit2.
. shunit2