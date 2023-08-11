Class {
	#name : #BenchyConfiguration,
	#superclass : #BenchybstractObject,
	#instVars : [
		'configurationName',
		'entries'
	],
	#category : #'Benchy-Core'
}

{ #category : #accessing }
BenchyConfiguration >> computeTimeAveragePerDay [

	| successfulBenchmarks durationsAverage stdev |
	
	successfulBenchmarks := self entries select: #isBenchmarkSuccess.
	successfulBenchmarks size < 2
		ifTrue: [
			durationsAverage := 0.
			stdev := 0 ]
		ifFalse: [ 
			| durations |
			durations := successfulBenchmarks collect: [ : measurementEntry | measurementEntry duration ].
			durationsAverage := durations average.
			stdev := durations stdev ].

	^ {
		  durationsAverage .
		  (durationsAverage + stdev) .
		  (durationsAverage - stdev) 
		}
]

{ #category : #accessing }
BenchyConfiguration >> configurationName [

	^ configurationName
]

{ #category : #accessing }
BenchyConfiguration >> configurationName: anObject [

	configurationName := anObject
]

{ #category : #accessing }
BenchyConfiguration >> entries [

	^ entries
]

{ #category : #accessing }
BenchyConfiguration >> entries: aCollection [ 

	entries := aCollection
]
