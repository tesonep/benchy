Class {
	#name : #BenchHistoryChart,
	#superclass : #Object,
	#instVars : [
		'fileReference'
	],
	#category : #BenchHistory
}

{ #category : #'instance creation' }
BenchHistoryChart class >> on: aPath [

	^ self new
		fileReference: aPath;
		yourself
]

{ #category : #benchmarks }
BenchHistoryChart >> benchmarks [
	"Answer a <Collection> of <BenchHistoryChart>"

	^ (NeoCSVReader on: self benchmarksReadStream)
		recordClass: BenchMeasurementEntry;
		skip: 2;
		separator: $,;
		addField: #measurement:;
		addField: #status:;
		addFloatField: #duration:;
		addIntegerField: #iterationsCount:;
		addField: #imageName:;
		addField: #vmName:;
		addField: #outputFilePath:;
		addField: #errFilePath:;
		addField: #time:;
		upToEnd.
]

{ #category : #benchmarks }
BenchHistoryChart >> benchmarksReadStream [
	"Answer a <ReadStream> on the results file"

	^ (fileReference / 'benchy-runs.csv') readStream
]

{ #category : #accessing }
BenchHistoryChart >> fileReference [
	^ fileReference
]

{ #category : #accessing }
BenchHistoryChart >> fileReference: aFileReference [

	fileReference := aFileReference asFileReference
]

{ #category : #accessing }
BenchHistoryChart >> historyOf: aString [

	^ BenchHistory new
		name: aString;
		root: self;
		yourself
]

{ #category : #plotting }
BenchHistoryChart >> plot [

	| canvas plots measurements successExecutions |
	canvas := RSCanvas new.
	measurements := self benchmarks groupedBy: [ :e | e measurement ].
	measurements do: [ : m | 
		m
			select: #isBenchmarkSuccess
			thenDo: [ : successfulMeasurement | self plotMeasurement: successfulMeasurement on: canvas  ].
		RSGridLayout on: plots.
		canvas @ RSCanvasController.
		canvas ].

]

{ #category : #private }
BenchHistoryChart >> plotMeasurement: aBenchMeasurementEntry on: aRSCanvas [ 

	| plot |
	
	plot = aBenchMeasurementEntry plot build asShape.
	aRSCanvas add: plot.
	" RSGridLayout on: plots "
	aRSCanvas @ RSCanvasController.
	^ aRSCanvas
]

{ #category : #accessing }
BenchHistoryChart >> resultsPerDate [

	| benchsPerDay |
	benchsPerDay := self benchmarks flatCollect: [ :bench |
		                bench configs resultsPerDate ].
	^ (benchsPerDay asOrderedCollection groupedBy: #date) collect: [
		  :benchs | benchs reduce: [ :a :b | a , b ] ]
]
