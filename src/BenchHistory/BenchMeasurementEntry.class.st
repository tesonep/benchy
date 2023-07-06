"
Represents a single measurement: a logical grouping for a time-stamped record.
"
Class {
	#name : #BenchMeasurementEntry,
	#superclass : #Object,
	#instVars : [
		'measurement',
		'status',
		'duration',
		'iterationsCount',
		'imageName',
		'vmName',
		'outputFilePath',
		'errFilePath',
		'time'
	],
	#category : #BenchHistory
}

{ #category : #accessing }
BenchMeasurementEntry >> duration [

	^ duration
]

{ #category : #accessing }
BenchMeasurementEntry >> duration: anObject [

	duration := anObject
]

{ #category : #accessing }
BenchMeasurementEntry >> errFilePath [

	^ errFilePath
]

{ #category : #accessing }
BenchMeasurementEntry >> errFilePath: anObject [

	errFilePath := anObject
]

{ #category : #accessing }
BenchMeasurementEntry >> imageName [

	^ imageName
]

{ #category : #accessing }
BenchMeasurementEntry >> imageName: anObject [

	imageName := anObject
]

{ #category : #accessing }
BenchMeasurementEntry >> iterationsCount [

	^ iterationsCount
]

{ #category : #accessing }
BenchMeasurementEntry >> iterationsCount: anObject [

	iterationsCount := anObject
]

{ #category : #accessing }
BenchMeasurementEntry >> measurement [

	^ measurement
]

{ #category : #accessing }
BenchMeasurementEntry >> measurement: anObject [

	measurement := anObject
]

{ #category : #accessing }
BenchMeasurementEntry >> outputFilePath [

	^ outputFilePath
]

{ #category : #accessing }
BenchMeasurementEntry >> outputFilePath: anObject [

	outputFilePath := anObject
]

{ #category : #printing }
BenchMeasurementEntry >> printOn: aStream [

	super printOn: aStream.
	aStream
		<< ' [';
		<< self measurement; space;
		<< self status; space;
		<< self duration asString; space;
		<< self iterationsCount asString; space;
		<< self imageName; space;
		<< self vmName; space;
		<< self time asString;
		<< ']'
]

{ #category : #accessing }
BenchMeasurementEntry >> status [

	^ status
]

{ #category : #accessing }
BenchMeasurementEntry >> status: anObject [

	status := anObject
]

{ #category : #accessing }
BenchMeasurementEntry >> time [

	^ time
]

{ #category : #accessing }
BenchMeasurementEntry >> time: anObject [

	time := anObject
]

{ #category : #accessing }
BenchMeasurementEntry >> vmName [

	^ vmName
]

{ #category : #accessing }
BenchMeasurementEntry >> vmName: anObject [

	vmName := anObject
]
