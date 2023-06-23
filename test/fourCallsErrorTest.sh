#!/usr/bin/env bash

source ${__dir}/common.sh

# The number of iterations can be passed as an optional argument, otherwise it's 1.
# However this test in its current state is designed to pass with 1 iterations.
ITERATIONS=${1:-1}

# Before any test, this command is executed
oneTimeSetUp() {
    result_file="./_build/results/benchy-runs.csv"
    date_time=aDate
    ITERATIONS=$ITERATIONS DATE=$date_time BENCHES_SCRIPT_DIR=test/testError/fourCalls ./runAll.sh
}

# After all tests, the results files are removed
oneTimeTearDown() {
    rm -rf ./_build/results
}

testResultFileExists() {
    assertTrue "[ -f $result_file ]"
}

# Checks that the first line in the csv file starts with "ERROR"
testLine1IsError() {
    local line
    
    line=$(sed '3q;d' "$result_file")
    assertContains "$line" "ERROR"
}

# Checks that the second line in the csv file starts with "OK"
testLine2IsOk() {
    local line
    
    line=$(sed '4q;d' "$result_file")
    assertContains "$line" "OK"
}

# Checks that the third line in the csv file starts with "ERROR"
testLine3IsError() {
    local line
    
    line=$(sed '5q;d' "$result_file")
    assertContains "$line" "ERROR"
}

# Checks that the fourth line in the csv file starts with "OK"
testLine4IsOk() {
    local line
    
    line=$(sed '6q;d' "$result_file")
    assertContains "$line" "OK"
}

# Checks that there are only 4 lines in the csv file
testOnlyFourLinesInFile() {
    local lineCount

    lineCount=$(wc -l < "$result_file" | bc)
    assertEquals 6 "$lineCount"
}

# Shift all command-line arguments before calling shunit2, so that arguments can be passed
shift $#

# Load shUnit2.
. shunit2