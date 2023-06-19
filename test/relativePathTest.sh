#!/usr/bin/env bash

# Before any test, this command is executed
oneTimeSetUp() {
    result_file="./_build/results/benchy-runs.csv"
    ITERATIONS=1 BENCHES_SCRIPT_DIR=test/testConfiguration ./runAll.sh aDate
}

# After all tests, the results files are removed
oneTimeTearDown() {
    rm -rf ./_build/results
}

testResultsExists() {
    assertTrue "[ -f ""$result_file"" ]"
}

# Load shUnit2.
. shunit2