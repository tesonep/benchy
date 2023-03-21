Class {
	#name : #BenchMulticonfiguration,
	#superclass : #BenchConfiguration,
	#instVars : [
		'configurations'
	],
	#category : #BenchHistory
}

{ #category : #copying }
BenchMulticonfiguration >> , aConfiguration [

	configurations add: aConfiguration
]

{ #category : #adding }
BenchMulticonfiguration >> addConfiguration: aBenchConfiguration [

	configurations add: aBenchConfiguration
]

{ #category : #plotting }
BenchMulticonfiguration >> addToChart: c [

	| b |
	b := RSLegend new.
	self addToChart: c legend: b.

	b container: c canvas.
	b legendDo: [ :shape | shape scaleBy: 0.6 ].
	b layout vertical.
	b location outer; right; offset: 210@(-200).
	b build
]

{ #category : #plotting }
BenchMulticonfiguration >> addToChart: aChart legend: aLegend [

	configurations do: [ :e | e addToChart: aChart legend: aLegend ]
]

{ #category : #accessing }
BenchMulticonfiguration >> configurations [
	^ configurations
]

{ #category : #accessing }
BenchMulticonfiguration >> dates [

	| maxDates |
	maxDates := #(  ).
	configurations do: [ :e | | dates |
		dates := e dates.
		dates size > maxDates size ifTrue: [ maxDates := dates ] ].
	^ maxDates
]

{ #category : #initialization }
BenchMulticonfiguration >> initialize [
	super initialize.
	configurations := OrderedCollection new
]

{ #category : #accessing }
BenchMulticonfiguration >> names [

	^ configurations collect: #name
]
