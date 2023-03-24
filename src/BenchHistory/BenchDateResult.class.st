Class {
	#name : #BenchDateResult,
	#superclass : #Object,
	#instVars : [
		'configuration',
		'date'
	],
	#category : #BenchHistory
}

{ #category : #adding }
BenchDateResult >> addToChart: c [

	| b times |
	b := RSLegend new.

	times := configuration configurations collect: [ :e |
		e timesForDate: date ].
	c addPlot: (RSBoxPlot new y: times).

	b container: c canvas.
	b legendDo: [ :shape | shape scaleBy: 0.6 ].
	b layout vertical.
	b location outer; right; offset: 210@(-200).
	b build
]

{ #category : #accessing }
BenchDateResult >> configuration: aBenchMulticonfiguration [
	configuration := aBenchMulticonfiguration
]

{ #category : #accessing }
BenchDateResult >> date: aString [
	date := aString
]

{ #category : #plotting }
BenchDateResult >> plot [

	| c |
	c := RSChart new.
	c title: configuration benchmark name, date.
	c colors: NSScale google20.
	self addToChart: c.
	c addDecoration: (RSHorizontalTick new fromNames: configuration names; useDiagonalLabel; yourself).
	c addDecoration: RSVerticalTick new asFloat.
	c addDecoration: RSYMarkerDecoration new average.
	^ c
]
