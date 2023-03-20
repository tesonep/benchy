Class {
	#name : #BenchHistory,
	#superclass : #Object,
	#instVars : [
		'name',
		'root'
	],
	#category : #BenchHistory
}

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
BenchHistory >> name [
	^ name
]

{ #category : #accessing }
BenchHistory >> root [
	^ root
]
