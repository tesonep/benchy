#!/usr/bin/env bash

# Set current file directory for relative access
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Before any test, this command is executed
oneTimeSetUp() {
    ${__dir}/../downloadImages.sh
    ${__dir}/../buildVMs.sh
    result_file="./_build/results/benchy-runs.csv"
    ITERATIONS=1 DATE=aDate ${__dir}/../runBenchs.sh slopstone
}

After all tests, the results files are removed
oneTimeTearDown() {
    rm -rf ./_build/results
}

testResultsExists() {
    assertTrue "[ -f ""$result_file"" ]"
}

extractColumnValueFromIteration() {
    local columnPosition="$1"
    local iterationNumber="$2"
    
    columnValue=$(awk -v iteration="$iterationNumber" 'NR==iteration' "$result_file" | cut -d',' -f "$columnPosition")
}

# Tests without benchmarks directory parameter. The tests don't check if every files exist after the command, they only check a few of them. It can be assumed that if they do exist, all exist.
testNoParamSlopstone() {
    extractColumnValueFromIteration 5 1
    assertEquals "benchmark=slopstone" "$columnValue"
}

testNoParamSlopstoneLatest9() {
    extractColumnValueFromIteration 7 1
    assertEquals "vm_name=latest9" "$columnValue"
}

testNoParamSlopstoneLatest10() {
    extractColumnValueFromIteration 7 2
    assertEquals "vm_name=latest10" "$columnValue"
}

testPharo11SMarkImageName() {
    extractColumnValueFromIteration 6 1
    assertEquals "image_name=Pharo11SMark" "$columnValue"
}

testPharo11ComposedImageSMark() {
    extractColumnValueFromIteration 6 3
    assertEquals "image_name=Pharo11ComposedImageSMark" "$columnValue"
}

testRequiredIterations() {
    extractColumnValueFromIteration 2 1
    assertEquals "req_iterations=1" "$columnValue"
}

testDate() {
    extractColumnValueFromIteration 3 1
    assertContains "$columnValue" "date=" 
}

testTime () {
    extractColumnValueFromIteration 4 1
    assertContains "$columnValue" "time="
}

testOutputFile () {
    extractColumnValueFromIteration 8 1
    assertContains "$columnValue" "output_file="
}

testErrFile () {
    extractColumnValueFromIteration 9 1
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