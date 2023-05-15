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


runBenchs() {

	for image in $IMAGES
	do
		for vm in $VMs
		do
			echo "Running bench \"$BENCH_NAME\" in \"$image\" on \"$vm\" for ${ITERATIONS} iterations"
			mkdir -p $BUILD_RESULTS_DIR/$BENCH_NAME-$image-$vm
			RESULT_FILE=$BUILD_RESULTS_DIR/$BENCH_NAME-$image-$vm/$BENCH_NAME-$image-$vm-$DATE.csv
			OUT_FILE=$BUILD_RESULTS_DIR/$BENCH_NAME-$image-$vm/$BENCH_NAME-$image-$vm-$DATE.stdout
			ERR_FILE=$BUILD_RESULTS_DIR/$BENCH_NAME-$image-$vm/$BENCH_NAME-$image-$vm-$DATE.stderr

			for (( i = 1; i <= $ITERATIONS; i++ )) 
			do
				echo "ITERATION: $i" >> $OUT_FILE
				echo "ITERATION: $i" >> $ERR_FILE
				
				FULL_COMMAND="$BUILD_VMS_DIR/$vm/$VM_CMD $VM_PARAMETERS $BUILD_IMAGES_DIR/$image/$image.image $PHARO_CMD"
				
				echo "CMD: $FULL_COMMAND" >> $OUT_FILE
				echo "CMD: $FULL_COMMAND" >> $ERR_FILE

				pushd $BUILD_RESULTS_DIR/$BENCH_NAME-$image-$vm > /dev/null
				TIMEFORMAT=%R
				RES="$( { time $FULL_COMMAND 1>>$OUT_FILE 2>> $ERR_FILE ; } 2>&1 )" && true
				
				if [ $? == 0 ]; then
					echo -e "OK\t$RES" >> $RESULT_FILE
				else
					echo -e "ERROR\t$RES" >> $RESULT_FILE
				fi
				
				popd > /dev/null
			done
		done
	done
}


# Run the benchmark configuration
# each configuration should call the runBenchs function to run
source $BENCH_SCRIPT