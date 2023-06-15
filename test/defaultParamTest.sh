#!/usr/bin/env bash

# Set current file directory for relative access
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source ${__dir}/common.sh

# Before any test, this command is executed
oneTimeSetUp() {
    ${__dir}/../downloadImages.sh
    ${__dir}/../buildVMs.sh
    resultsFile="./_build/results/benchy-runs.csv"
    ITERATIONS=1 DATE=aDate ${__dir}/../runBenchs.sh slopstone
}

After all tests, the results files are removed
oneTimeTearDown() {
    rm -rf ./_build/results
}

# Tests without benchmarks directory parameter. The tests don't check if every files exist after the command, they only check a few of them. It can be assumed that if they do exist, all exist.
testNoParamSlopstone() {
    extractColumnValueFromIterationIn 5 1 "$resultsFile"
    assertEquals "benchmark=slopstone" "$columnValue"
}

testNoParamSlopstoneLatest9() {
    extractColumnValueFromIterationIn 7 1 "$resultsFile"
    assertEquals "vm_name=latest9" "$columnValue"
}

testNoParamSlopstoneLatest10() {
    extractColumnValueFromIterationIn 7 2 "$resultsFile"
    assertEquals "vm_name=latest10" "$columnValue"
}

testPharo11SMarkImageName() {
    extractColumnValueFromIterationIn 6 1 "$resultsFile"
    assertEquals "image_name=Pharo11SMark" "$columnValue"
}

testPharo11ComposedImageSMark() {
    extractColumnValueFromIterationIn 6 3 "$resultsFile"
    assertEquals "image_name=Pharo11ComposedImageSMark" "$columnValue"
}

testRequiredIterations() {
    extractColumnValueFromIterationIn 2 1 "$resultsFile"
    assertEquals "req_iterations=1" "$columnValue"
}

testDate() {
    extractColumnValueFromIterationIn 3 1 "$resultsFile"
    assertContains "$columnValue" "date=" 
}

testTime () {
    extractColumnValueFromIterationIn 4 1 "$resultsFile"
    assertContains "$columnValue" "time="
}

testOutputFile () {
    extractColumnValueFromIterationIn 8 1 "$resultsFile"
    assertContains "$columnValue" "output_file="
}

testErrFile () {
    extractColumnValueFromIterationIn 9 1 "$resultsFile"
    assertContains "$columnValue" "err_file="
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