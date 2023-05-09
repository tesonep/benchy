#!/usr/bin/env bash

# Before any test, this command is executed
oneTimeSetUp() {
    ITERATIONS=1 BENCHES_SCRIPT_DIR=`pwd`/test/testConfiguration ./runAll.sh aDate
}

# After all tests, the results files are removed
oneTimeTearDown() {
    rm -rf ./_build/results
}

# Tests with an absolute path as benchmarks directory parameter
testAbsolPathPharo11Latest9() {
    assertTrue "[ -f ./_build/results/test-Pharo11-latest9/test-Pharo11-latest9-aDate.csv ]"
}

testAbsolPathPharo10Latest10() {
    assertTrue "[ -f ./_build/results/test-Pharo10-latest10/test-Pharo10-latest10-aDate.csv ]"
}

# Load shUnit2.
. shunit2