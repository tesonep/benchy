Class {
	#name : #BenchMultiChart,
	#superclass : #Object,
	#instVars : [
		'benchmarks'
	],
	#category : #BenchHistory
}

{ #category : #factory }
BenchMultiChart class >> benchmarks: aCollection [

	^ self new
		  benchmarks: aCollection;
		  yourself
]

{ #category : #copying }
BenchMultiChart >> , aBenchResult [ 

	benchmarks add: aBenchResult
]

{ #category : #accessing }
BenchMultiChart >> benchmarks [

	^ benchmarks
]

{ #category : #accessing }
BenchMultiChart >> benchmarks: aCollection [

	benchmarks := aCollection asOrderedCollection
]

{ #category : #plotting }
BenchMultiChart >> plot [

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

{ #category : #filter }
BenchMultiChart >> selectConfigs: aBlockClosure [ 

	"This method has effect!"
	
	benchmarks do: [ :b | b selectConfigs: aBlockClosure ]
]
