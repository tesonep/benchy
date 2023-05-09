#!/usr/bin/env bash

# Before any test, this command is executed
oneTimeSetUp() {
    ITERATIONS=1 BENCHES_SCRIPT_DIR=test/testConfiguration ./runAll.sh aDate
}

# After all tests, the results files are removed
oneTimeTearDown() {
    rm -rf ./_build/results
}

# Tests with a relative path as benchmarks directory parameter
testRelatPathPharo11Latest9() {
    assertTrue "[ -f ./_build/results/test-Pharo11-latest9/test-Pharo11-latest9-aDate.csv ]"
}

testRelatPathPharo10Latest10() {
    assertTrue "[ -f ./_build/results/test-Pharo10-latest10/test-Pharo10-latest10-aDate.csv ]"
}

# Load shUnit2.
. shunit2