set -e
[[ ! -z "$DEBUG" ]] && set -x

ITERATIONS=${ITERATIONS:=30}
BENCH_NAME_WITH_EXTENSION=$(basename $0) 
BENCH_NAME=${BENCH_NAME_WITH_EXTENSION%%.*}

ARCH=$(uname -m)
OS=$(uname -s)

BENCHES_SCRIPT_DIR=$1
BUILD_VMS_DIR=$2 
BUILD_IMAGES_DIR=$3 
BUILD_RESULTS_DIR=$4
DATE=$5

if [ "$OS" == "Darwin" ]; then
	VM_CMD="Pharo.app/Contents/MacOS/Pharo"
fi

if [ "$OS" == "Linux" ]; then
	VM_CMD="pharo"
fi

for image in $IMAGES
do
	for vm in $VMs
	do
		echo "Running bench \"$BENCH_NAME\" in \"$image\" on \"$vm\""
		mkdir -p $BUILD_RESULTS_DIR/$BENCH_NAME-$image-$vm
		RESULT_FILE=$BUILD_RESULTS_DIR/$BENCH_NAME-$image-$vm/$BENCH_NAME-$image-$vm-$DATE.csv
		OUT_FILE=$BUILD_RESULTS_DIR/$BENCH_NAME-$image-$vm/$BENCH_NAME-$image-$vm-$DATE.stdout
		ERR_FILE=$BUILD_RESULTS_DIR/$BENCH_NAME-$image-$vm/$BENCH_NAME-$image-$vm-$DATE.stderr

		for (( i = 1; i <= $ITERATIONS; i++ )) 
		do
			echo "ITERATION: $i" >> $OUT_FILE
			echo "ITERATION: $i" >> $ERR_FILE
			
			FULL_COMMAND="$BUILD_VMS_DIR/$vm/$VM_CMD $BUILD_IMAGES_DIR/$image/$image.image $PHARO_CMD"
			
			echo "CMD: $FULL_COMMAND" >> $OUT_FILE
			echo "CMD: $FULL_COMMAND" >> $ERR_FILE

			pushd $BUILD_RESULTS_DIR/$BENCH_NAME-$image-$vm > /dev/null
			TIMEFORMAT=%R
			{ time $FULL_COMMAND 1>>$OUT_FILE 2>> $ERR_FILE ; } 2>> $RESULT_FILE
			popd > /dev/null
		done
	done
done