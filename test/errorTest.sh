#!/usr/bin/env bash

# Before any test, this command is executed
oneTimeSetUp() {
    BENCHES_SCRIPT_DIR=test/testError ./runAll.sh aDate
}

# After all tests, the results files are removed
oneTimeTearDown() {
    rm -rf ./_build/results
}

# Checks that the first line in the csv file starts with "ERROR"
testLine1IsError() {
    local line=$(tail -4 ./_build/results/benchmarkWithError-Pharo11-latest10/benchmarkWithError-Pharo11-latest10-aDate.csv | head -1)
    assertTrue '[[ "$line" == ERROR* ]]'
}

# Checks that the second line in the csv file starts with "OK"
testLine2IsOk() {
    local line=$(tail -3 ./_build/results/benchmarkWithError-Pharo11-latest10/benchmarkWithError-Pharo11-latest10-aDate.csv | head -1)
    assertTrue '[[ "$line" == OK* ]]'
}

# Checks that the third line in the csv file starts with "ERROR"
testLine3IsError() {
    local line=$(tail -2 ./_build/results/benchmarkWithError-Pharo11-latest10/benchmarkWithError-Pharo11-latest10-aDate.csv | head -1)
    assertTrue '[[ "$line" == ERROR* ]]'
}

# Checks that the fourth line in the csv file starts with "OK"
testLine4IsOk() {
    local line=$(tail -1 ./_build/results/benchmarkWithError-Pharo11-latest10/benchmarkWithError-Pharo11-latest10-aDate.csv)
    assertTrue '[[ "$line" == OK* ]]'
}

# Checks that there are only 4 lines in the csv file
testOnlyFourLinesInFile() {
    assertEquals 4 "$(cat ./_build/results/benchmarkWithError-Pharo11-latest10/benchmarkWithError-Pharo11-latest10-aDate.csv | wc -l)"
}

# Load shUnit2.
. shunit2