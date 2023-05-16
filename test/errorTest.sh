#!/usr/bin/env bash

# Before any test, this command is executed
oneTimeSetUp() {
    ITERATIONS=1 BENCHES_SCRIPT_DIR=test/testError ./runAll.sh aDate
}

# After all tests, the results files are removed
oneTimeTearDown() {
    rm -rf ./_build/results
}

# Test if the line in the csv file starts with "OK"
testLine1IsError() {
    local line=$( sed '1q;d' ./_build/results/benchmarkWithError-Pharo11-latest10/benchmarkWithError-Pharo11-latest10-aDate.csv )
    assertTrue '[[ "$line" == ERROR* ]]'
}

testLine2IsOk() {
    local line=$( sed '2q;d' ./_build/results/benchmarkWithError-Pharo11-latest10/benchmarkWithError-Pharo11-latest10-aDate.csv )
    assertTrue '[[ "$line" == OK* ]]'
}

testLine3IsError() {
    local line=$( sed '3q;d' ./_build/results/benchmarkWithError-Pharo11-latest10/benchmarkWithError-Pharo11-latest10-aDate.csv )
    assertTrue '[[ "$line" == ERROR* ]]'
}

testLine4IsOk() {
    local line=$( sed '4q;d' ./_build/results/benchmarkWithError-Pharo11-latest10/benchmarkWithError-Pharo11-latest10-aDate.csv )
    assertTrue '[[ "$line" == OK* ]]'
}

# Load shUnit2.
. shunit2