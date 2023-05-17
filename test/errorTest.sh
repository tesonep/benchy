#!/usr/bin/env bash

# Before any test, this command is executed
oneTimeSetUp() {
    ITERATIONS=1 BENCHES_SCRIPT_DIR=test/testError ./runAll.sh aDate
}

# After all tests, the results files are removed
# oneTimeTearDown() {
#     rm -rf ./_build/results
# }

# Test if the line in the csv file starts with "OK"
testLine1IsError() {
    local line=$(tail -4 ./_build/results/benchmarkWithError-Pharo11-latest10/benchmarkWithError-Pharo11-latest10-aDate.csv | head -1)
    assertTrue '[[ "$line" == ERROR* ]]'
}

testLine2IsOk() {
    local line=$(tail -3 ./_build/results/benchmarkWithError-Pharo11-latest10/benchmarkWithError-Pharo11-latest10-aDate.csv | head -1)
    assertTrue '[[ "$line" == OK* ]]'
}

testLine3IsError() {
    local line=$(tail -2 ./_build/results/benchmarkWithError-Pharo11-latest10/benchmarkWithError-Pharo11-latest10-aDate.csv | head -1)
    assertTrue '[[ "$line" == ERROR* ]]'
}

testLine4IsOk() {
    local line=$(tail -1 ./_build/results/benchmarkWithError-Pharo11-latest10/benchmarkWithError-Pharo11-latest10-aDate.csv)
    assertTrue '[[ "$line" == OK* ]]'
}

# Load shUnit2.
. shunit2