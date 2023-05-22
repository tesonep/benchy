#!/usr/bin/env bash

# The number of iterations can be passed as an optional argument, otherwise it's 1.
# However this test in its current state is designed to pass with 1 iterations.
ITERATIONS=${1:-1}

# Before any test, this command is executed
oneTimeSetUp() {
    ITERATIONS=$ITERATIONS BENCHES_SCRIPT_DIR=test/testError/fourCalls ./runAll.sh aDate
}

# After all tests, the results files are removed
oneTimeTearDown() {
    cat ./_build/results/fourRunBenchsCallsBenchmark-Pharo11-latest10/fourRunBenchsCallsBenchmark-Pharo11-latest10-aDate.stderr
    rm -rf ./_build/results
}

# Checks that the first line in the csv file starts with "ERROR"
testLine1IsError() {
    local line=$(sed '1q;d' ./_build/results/fourRunBenchsCallsBenchmark-Pharo11-latest10/fourRunBenchsCallsBenchmark-Pharo11-latest10-aDate.csv)
    assertTrue '[[ "$line" == ERROR* ]]'
}

# Checks that the second line in the csv file starts with "OK"
testLine2IsOk() {
    local line=$(sed '2q;d' ./_build/results/fourRunBenchsCallsBenchmark-Pharo11-latest10/fourRunBenchsCallsBenchmark-Pharo11-latest10-aDate.csv)
    assertTrue '[[ "$line" == OK* ]]'
}

# Checks that the third line in the csv file starts with "ERROR"
testLine3IsError() {
    local line=$(sed '3q;d' ./_build/results/fourRunBenchsCallsBenchmark-Pharo11-latest10/fourRunBenchsCallsBenchmark-Pharo11-latest10-aDate.csv)
    assertTrue '[[ "$line" == ERROR* ]]'
}

# Checks that the fourth line in the csv file starts with "OK"
testLine4IsOk() {
    local line=$(sed '4q;d' ./_build/results/fourRunBenchsCallsBenchmark-Pharo11-latest10/fourRunBenchsCallsBenchmark-Pharo11-latest10-aDate.csv)
    assertTrue '[[ "$line" == OK* ]]'
}

# Checks that there are only 4 lines in the csv file
testOnlyFourLinesInFile() {
    assertEquals 4 "$(cat ./_build/results/fourRunBenchsCallsBenchmark-Pharo11-latest10/fourRunBenchsCallsBenchmark-Pharo11-latest10-aDate.csv | wc -l)"
}

# Shift all command-line arguments before calling shunit2, so that arguments can be passed
shift $#
# Load shUnit2.
. shunit2