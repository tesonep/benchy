#!/usr/bin/env bash

export columnValue

extractColumnValueFromIterationIn() {
    local columnPosition="$1"
    local iterationNumber="$2"
    local resultsFile="$3"
    
    columnValue=$(awk -v iteration="$iterationNumber" 'NR==iteration' "$resultsFile" | cut -d',' -f "$columnPosition")
}
