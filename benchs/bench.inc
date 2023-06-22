set -e

ARCH=$(uname -m)
OS=$(uname -s)

BENCHES_SCRIPT_DIR=$1
BUILD_VMS_DIR=$2 
BUILD_IMAGES_DIR=$3 
BUILD_RESULTS_DIR=$4
DATE=$5
BENCH_SCRIPT=$6

ITERATIONS=${ITERATIONS:=30}
BENCH_NAME_WITH_EXTENSION="${BENCH_SCRIPT##*/}"
BENCH_NAME=${BENCH_NAME_WITH_EXTENSION%%.*}
date_cmd="date"

# Optional parameter. Leaving it blank if is not defined by the benchmark
VM_PARAMETERS=${VM_PARAMETERS:=}

setPlatformOptions() {
	if [ "$OS" == "Darwin" ]; then
		VM_CMD="Pharo.app/Contents/MacOS/Pharo"
		date_cmd="gdate"
	elif [ "$OS" == "Linux" ]; then
		VM_CMD="pharo"
	elif [ "$OS" == "MINGW64_NT-*" ]; then
		VM_CMD="PharoConsole.exe"
	fi
}

# Write benchmark results to file
writeStatus() {
	local status="$1"
	local reqIterations="$2"
	local benchmark="$3"
	local imageName="$4"
	local vmName="$5"
	local outFile="$6"
	local errFile="$7"
	local duration="$8"

	currentTimestamp=$("$date_cmd" -u +"%Y-%m-%dT%H:%M:%SZ")

	printf "%s,%s,%s,%s,%s,%s,%s,%s,%s\n" "$benchmark" "$status" "$duration" "$reqIterations" "$imageName" "$vmName" "$outFile" "$errFile" "$currentTimestamp" >> "$result_file"
}

runBenchs() {
	setPlatformOptions
	[ -d "$BUILD_RESULTS_DIR" ] ||  mkdir "$BUILD_RESULTS_DIR"

	for image in $IMAGES
	do
		for vm in $VMs
		do
			echo "Running bench \"$BENCH_NAME\" in \"$image\" on \"$vm\" for ${ITERATIONS} iterations"

			# Ensure result directory exist (with parent) for this iteration
			RESULT_DIR=$BUILD_RESULTS_DIR/$BENCH_NAME-$image-$vm
			mkdir -p "$RESULT_DIR"

			# RESULT_FILE=$RESULT_DIR/$BENCH_NAME-$image-$vm-$DATE.csv
			OUT_FILE=$RESULT_DIR/$BENCH_NAME-$image-$vm-$DATE.stdout
			ERR_FILE=$RESULT_DIR/$BENCH_NAME-$image-$vm-$DATE.stderr

			for (( i = 1; i <= $ITERATIONS; i++ )) 
			do
				local ITERATION=$i
				echo "ITERATION: $i" >> "$OUT_FILE"
				echo "ITERATION: $i" >> "$ERR_FILE"

				if [ "$BEFORE_CMD" ]; then
					local EXPANDED_BEFORE_CMD=$(echo $BEFORE_CMD | RESULT_DIR=$RESULT_DIR ITERATION=$ITERATION envsubst)
					echo "CMD: $EXPANDED_BEFORE_CMD" >> $OUT_FILE
					echo "CMD: $EXPANDED_BEFORE_CMD" >> $ERR_FILE
					$EXPANDED_BEFORE_CMD 1>>"$OUT_FILE" 2>>"$ERR_FILE" && true
				fi

				# Expand variables in the command for benchmarks.
				# It does nothing to commands that don't need them.
				local EXPANDED_PHARO_CMD=$(echo $PHARO_CMD | RESULT_DIR=$RESULT_DIR ITERATION=$ITERATION envsubst)

				vm_exe_path=$BUILD_VMS_DIR/$vm/$VM_CMD
				FULL_COMMAND="$vm_exe_path $VM_PARAMETERS $BUILD_IMAGES_DIR/$image/$image.image $EXPANDED_PHARO_CMD"
				
				echo "CMD: $FULL_COMMAND" >> $OUT_FILE
				echo "CMD: $FULL_COMMAND" >> $ERR_FILE

				pushd "$BUILD_RESULTS_DIR"/"$BENCH_NAME"-"$image"-"$vm" > /dev/null
				TIMEFORMAT=%R

				# Measure using the shell built-in time
				RES="$( { time $FULL_COMMAND 1>>"$OUT_FILE" 2>> "$ERR_FILE" ; } 2>&1 )" && true
				
				if [ $? == 0 ]; then
					writeStatus "OK" "$ITERATIONS" "$BENCH_NAME" "$image" "$vm" "$OUT_FILE" "$ERR_FILE" "$RES"
				else
					writeStatus "ERROR" "$ITERATIONS" "$BENCH_NAME" "$image" "$vm" "$OUT_FILE" "$ERR_FILE" "$RES"
				fi

				if [ "$AFTER_CMD" ]; then
					local EXPANDED_AFTER_CMD
					
					EXPANDED_AFTER_CMD=$(echo $AFTER_CMD | RESULT_DIR=$RESULT_DIR ITERATION=$ITERATION envsubst)
					echo "CMD: $EXPANDED_AFTER_CMD" >> $OUT_FILE
					echo "CMD: $EXPANDED_AFTER_CMD" >> $ERR_FILE
					$EXPANDED_AFTER_CMD 1>>$OUT_FILE 2>>$ERR_FILE && true
				fi
				
				popd > /dev/null
			done
		done
	done
}

# Run the benchmark configuration
# each configuration should call the runBenchs function to run
source "$BENCH_SCRIPT"
