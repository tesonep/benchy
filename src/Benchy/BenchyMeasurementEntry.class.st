"
Represents a single measurement: a logical grouping for a time-stamped record.
"
Class {
	#name : #BenchyMeasurementEntry,
	#superclass : #BenchybstractObject,
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
	#category : #Benchy
}

{ #category : #accessing }
BenchyMeasurementEntry >> dayTime [
	" Answer the receiver's time of creation up to day precision (this is for grouping measurements by day in the X-axis in the chart)"

	^ (DateAndTime fromString: self time) asDate
]

{ #category : #accessing }
BenchyMeasurementEntry >> duration [

	^ duration
]

{ #category : #accessing }
BenchyMeasurementEntry >> duration: anObject [

	duration := anObject
]

{ #category : #accessing }
BenchyMeasurementEntry >> errFilePath [

	^ errFilePath
]

{ #category : #accessing }
BenchyMeasurementEntry >> errFilePath: anObject [

	errFilePath := anObject
]

{ #category : #accessing }
BenchyMeasurementEntry >> imageName [

	^ imageName
]

{ #category : #accessing }
BenchyMeasurementEntry >> imageName: anObject [

	imageName := anObject
]

{ #category : #testing }
BenchyMeasurementEntry >> isBenchmarkSuccess [ 

	^ self status = 'OK'
]

{ #category : #accessing }
BenchyMeasurementEntry >> iterationsCount [

	^ iterationsCount
]

{ #category : #accessing }
BenchyMeasurementEntry >> iterationsCount: anObject [

	iterationsCount := anObject
]

{ #category : #accessing }
BenchyMeasurementEntry >> measurement [

	^ measurement
]

{ #category : #accessing }
BenchyMeasurementEntry >> measurement: anObject [

	measurement := anObject
]

{ #category : #accessing }
BenchyMeasurementEntry >> outputFilePath [

	^ outputFilePath
]

{ #category : #accessing }
BenchyMeasurementEntry >> outputFilePath: anObject [

	outputFilePath := anObject
]

{ #category : #plotting }
BenchyMeasurementEntry >> plot [

	| c |
	c := RSChart new.
	c title: self measurement.
	c colors: NSScale google20.
	self addToChart: c.
	^ c
]

{ #category : #printing }
BenchyMeasurementEntry >> printOn: aStream [

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
BenchyMeasurementEntry >> status [

	^ status
]

{ #category : #accessing }
BenchyMeasurementEntry >> status: anObject [

	status := anObject
]

{ #category : #accessing }
BenchyMeasurementEntry >> time [

	^ time
]

{ #category : #accessing }
BenchyMeasurementEntry >> time: anObject [

	time := anObject
]

{ #category : #accessing }
BenchyMeasurementEntry >> vmName [

	^ vmName
]

{ #category : #accessing }
BenchyMeasurementEntry >> vmName: anObject [

	vmName := anObject
]
