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

# Optional parameter. Leaving it blank if is not defined by the benchmark
VM_PARAMETERS=${VM_PARAMETERS:=}

if [ "$OS" == "Darwin" ]; then
	VM_CMD="Pharo.app/Contents/MacOS/Pharo"
fi

if [ "$OS" == "Linux" ]; then
	VM_CMD="pharo"
fi

if [[ "$OS" == MINGW64_NT-* ]]; then
	VM_CMD="PharoConsole.exe"
fi

# Write benchmark status to a results file
writeStatus() {
	local status="$1"
	local reqIterations="$2"
	local benchmark="$3"
	local imageName="$4"
	local vmName="$5"
	local currentDate
	local currentTime
	local resultFile="$6"
	local outFile="$7"
	local errFile="$8"

	currentDate=$(date +%d-%m-%Y)
	currentTime=$(date +%H:%M:%S)
	printf "status=%s,req_iterations=%s,date=%s,time=%s,benchmark=%s,image_name=%s,vm_name=%s,output_file=%s,err_file=%s\n" "$status" "$reqIterations" "$currentDate" "$currentTime" "$benchmark" "$imageName" "$vmName" "$outFile" "$errFile" >> "$resultFile"
}

runBenchs() {
	for image in $IMAGES
	do
		for vm in $VMs
		do
			echo "Running bench \"$BENCH_NAME\" in \"$image\" on \"$vm\" for ${ITERATIONS} iterations"
			RESULT_DIR=$BUILD_RESULTS_DIR/$BENCH_NAME-$image-$vm
			mkdir -p "$RESULT_DIR"
			# RESULT_FILE=$RESULT_DIR/$BENCH_NAME-$image-$vm-$DATE.csv
			RESULT_FILE="$BUILD_RESULTS_DIR"/"benchy-runs.csv"
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

				FULL_COMMAND="$BUILD_VMS_DIR/$vm/$VM_CMD $VM_PARAMETERS $BUILD_IMAGES_DIR/$image/$image.image $EXPANDED_PHARO_CMD"
				
				echo "CMD: $FULL_COMMAND" >> $OUT_FILE
				echo "CMD: $FULL_COMMAND" >> $ERR_FILE

				pushd "$BUILD_RESULTS_DIR"/"$BENCH_NAME"-"$image"-"$vm" > /dev/null
				TIMEFORMAT=%R
				RES="$( { time $FULL_COMMAND 1>>"$OUT_FILE" 2>> "$ERR_FILE" ; } 2>&1 )" && true
				
				if [ $? == 0 ]; then
					writeStatus "OK" "$ITERATIONS" "$BENCH_NAME" "$image" "$vm" "$RESULT_FILE" "$OUT_FILE" "$ERR_FILE"
				else
					writeStatus "ERROR" "$ITERATIONS" "$BENCH_NAME" "$image" "$vm" "$RESULT_FILE" "$OUT_FILE" "$ERR_FILE"
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