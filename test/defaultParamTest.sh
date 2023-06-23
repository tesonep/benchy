#!/usr/bin/env bash

# Set current file directory for relative access
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source ${__dir}/common.sh

# Before any test, this command is executed
oneTimeSetUp() {
    ${__dir}/../downloadImages.sh
    ${__dir}/../buildVMs.sh
    resultsFile="./_build/results/benchy-runs.csv"
    ITERATIONS=1 ${__dir}/../runBenchs.sh slopstone
}

# After all tests, the results files are removed
oneTimeTearDown() {
    rm -rf ./_build/results
}

# Tests without benchmarks directory parameter. The tests don't check if every files exist after the command, they only check a few of them. It can be assumed that if they do exist, all exist.
testNoParamSlopstone() {
    extractColumnValueFromIterationIn 1 3 "$resultsFile"
    assertEquals "slopstone" "$columnValue"
}

testNoParamSlopstoneLatest9() {
    extractColumnValueFromIterationIn 6 3 "$resultsFile"
    assertEquals "latest9" "$columnValue"
}

testNoParamSlopstoneLatest10() {
    extractColumnValueFromIterationIn 6 4 "$resultsFile"
    assertEquals "latest10" "$columnValue"
}

testPharo11SMarkImageName() {
    extractColumnValueFromIterationIn 5 3 "$resultsFile"
    assertEquals "Pharo11SMark" "$columnValue"
}

testPharo11ComposedImageSMark() {
    extractColumnValueFromIterationIn 5 5 "$resultsFile"
    assertEquals "Pharo11ComposedImageSMark" "$columnValue"
}

testRequiredIterations() {
    extractColumnValueFromIterationIn 4 3 "$resultsFile"
    assertEquals "1" "$columnValue"
}

testDate() {
    extractColumnValueFromIterationIn 9 3 "$resultsFile"
    assertNotNull "$columnValue" 1 
}

testOutputFile () {
    extractColumnValueFromIterationIn 7 3 "$resultsFile"
    assertContains "$columnValue" "stdout"
}

testErrFile () {
    extractColumnValueFromIterationIn 8 3 "$resultsFile"
    assertContains "$columnValue" "stderr"
}

# To uncomment when Druid builds ok
#testDruidImageName() {
#    extractColumnValueFromIteration 6 ?
#    assertEquals "image_name=druid" "$columnValue"
#}

# To uncomment when JIT zero builds ok
#testNoParamSmarkCompileriJitZero() {
#    extractColumnValueFromIteration 6 ?
#    assertEquals "image_name=druid" "$columnValue"
#}

# Load shUnit2.
. shunit2