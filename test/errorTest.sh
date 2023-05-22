#!/usr/bin/env bash

# Before any test, this command is executed
oneTimeSetUp() {
    ITERATIONS=4 BENCHES_SCRIPT_DIR=test/testError ./runAll.sh aDate
}

# After all tests, the results files are removed
oneTimeTearDown() {
    rm -rf ./_build/results
}

# Tests concerning the 4 iterations loop benchmark

# Checks that the first line in the csv file starts with "ERROR"
testFourIterationsLine1IsError() {
    local line=$(tail -4 ./_build/results/FourIterationsLoopBenchmark-Pharo11-latest10/FourIterationsLoopBenchmark-Pharo11-latest10-aDate.csv | head -1)
    assertTrue '[[ "$line" == ERROR* ]]'
}

# Checks that the second line in the csv file starts with "OK"
testFourIterationsLine2IsOk() {
    local line=$(tail -3 ./_build/results/FourIterationsLoopBenchmark-Pharo11-latest10/FourIterationsLoopBenchmark-Pharo11-latest10-aDate.csv | head -1)
    assertTrue '[[ "$line" == OK* ]]'
}

# Checks that the third line in the csv file starts with "ERROR"
testFourIterationsLine3IsError() {
    local line=$(tail -2 ./_build/results/FourIterationsLoopBenchmark-Pharo11-latest10/FourIterationsLoopBenchmark-Pharo11-latest10-aDate.csv | head -1)
    assertTrue '[[ "$line" == ERROR* ]]'
}

# Checks that the fourth line in the csv file starts with "OK"
testFourIterationsLine4IsOk() {
    local line=$(tail -1 ./_build/results/FourIterationsLoopBenchmark-Pharo11-latest10/FourIterationsLoopBenchmark-Pharo11-latest10-aDate.csv)
    assertTrue '[[ "$line" == OK* ]]'
}

# Checks that there are only 4 lines in the csv file
testFourIterationsOnlyFourLinesInFile() {
    assertEquals 4 "$(cat ./_build/results/FourIterationsLoopBenchmark-Pharo11-latest10/FourIterationsLoopBenchmark-Pharo11-latest10-aDate.csv | wc -l)"
}


# Tests concerning the 4 runBenchs calls benchmark
# Since there are 4 iterations, the test checks the line of the first iteration for each call, and we assume that if the test passes, all other iterations of this call would pass as well.

# Checks that the first line in the csv file starts with "ERROR"
testFourCallsLine1IsError() {
    local line=$(sed '1q;d' ./_build/results/FourRunBenchsCallsBenchmark-Pharo11-latest10/FourRunBenchsCallsBenchmark-Pharo11-latest10-aDate.csv)
    assertTrue '[[ "$line" == ERROR* ]]'
}

# Checks that the second line in the csv file starts with "OK"
testFourCallsLine5IsOk() {
    local line=$(sed '5q;d'  ./_build/results/FourRunBenchsCallsBenchmark-Pharo11-latest10/FourRunBenchsCallsBenchmark-Pharo11-latest10-aDate.csv)
    assertTrue '[[ "$line" == OK* ]]'
}

# Checks that the third line in the csv file starts with "ERROR"
testFourCallsLine9IsError() {
    local line=$(sed '9q;d'  ./_build/results/FourRunBenchsCallsBenchmark-Pharo11-latest10/FourRunBenchsCallsBenchmark-Pharo11-latest10-aDate.csv)
    assertTrue '[[ "$line" == ERROR* ]]'
}

# Checks that the fourth line in the csv file starts with "OK"
testFourCallsLine13IsOk() {
    local line=$(sed '13q;d'  ./_build/results/FourRunBenchsCallsBenchmark-Pharo11-latest10/FourRunBenchsCallsBenchmark-Pharo11-latest10-aDate.csv)
    assertTrue '[[ "$line" == OK* ]]'
}

# Checks that there are only 16 (4 iterations with 4 runBenchs calls each) lines in the csv file
testFourCallsOnlySixteenLinesInFile() {
    assertEquals 16 "$(cat ./_build/results/FourRunBenchsCallsBenchmark-Pharo11-latest10/FourRunBenchsCallsBenchmark-Pharo11-latest10-aDate.csv | wc -l)"
}

# Load shUnit2.
. shunit2