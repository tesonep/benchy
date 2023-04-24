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

	^ (fileReference children
		   collect: [ :e | e basename copyUpTo: $- ]
		   as: Set) collect: [ :e | self historyOf: e ]
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
