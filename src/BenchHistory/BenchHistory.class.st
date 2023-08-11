Class {
	#name : #BenchHistory,
	#superclass : #Object,
	#instVars : [
		'name',
		'root'
	],
	#category : #BenchHistory
}

{ #category : #'instance creation' }
BenchHistory class >> on: aPath [

	^ self new
		fileReference: aPath;
		yourself
]

{ #category : #accessing }
BenchHistory >> configAt: aCollection [

	^ BenchConfiguration new
		bench: self;
		config: aCollection;
		yourself
]

{ #category : #accessing }
BenchHistory >> configs [

	| prefix |
	prefix := name , '-'.
	^ (root fileReference children
		   select: [ :e | e basename beginsWith: prefix ]
		   thenCollect: [ :e |
		   self configAt: { (e basename allButFirst: prefix size) } ])
		  reduce: [ :a :b | a , b ]
]

{ #category : #accessing }
BenchHistory >> fileReference [

	^ self root fileReference / name
]

{ #category : #accessing }
BenchHistory >> name [
	^ name
]

{ #category : #accessing }
BenchHistory >> name: aString [

	name := aString
]

{ #category : #plotting }
BenchHistory >> plot [

	^ self configs plot
]

{ #category : #accessing }
BenchHistory >> root [
	^ root
]

{ #category : #accessing }
BenchHistory >> root: aBenchHistoryChart [
	root := aBenchHistoryChart
]
