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

	| canvas plots |
	canvas := RSCanvas new.
	plots := self benchmarks collect: [ :e | | p |
		p := e plot build asShape.
		canvas add: p.
		p
	].
	RSGridLayout on: plots.
	canvas @ RSCanvasController.
	^ canvas
]

{ #category : #accessing }
BenchHistoryChart >> resultsPerDate [

	| benchsPerDay |
	benchsPerDay := self benchmarks flatCollect: [ :bench |
		                bench configs resultsPerDate ].
	^ (benchsPerDay asOrderedCollection groupedBy: #date) collect: [
		  :benchs | benchs reduce: [ :a :b | a , b ] ]
]
