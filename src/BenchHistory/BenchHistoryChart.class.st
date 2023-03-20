Class {
	#name : #BenchHistoryChart,
	#superclass : #Object,
	#instVars : [
		'fileReference'
	],
	#category : #BenchHistory
}

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
