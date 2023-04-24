Class {
	#name : #BenchDateResult,
	#superclass : #Object,
	#instVars : [
		'configuration',
		'date'
	],
	#category : #BenchHistory
}

{ #category : #copying }
BenchDateResult >> , aBench [

	^ BenchMultiChart benchmarks: {
			  self.
			  aBench }
]

{ #category : #adding }
BenchDateResult >> addToChart: c [

	| b times |
	b := RSLegend new.

	times := (configuration configurations sorted: #name ascending)
		         collect: [ :e | e timesForDate: date ]
		         thenSelect: [ :e | e isNotEmpty ].
	c addPlot: (RSBoxPlot new y: times).

	b container: c canvas.
	b legendDo: [ :shape | shape scaleBy: 0.8 ].
	b layout vertical.
	b location
		outer;
		right;
		offset: 210 @ -200.
	b build
]

{ #category : #accessing }
BenchDateResult >> configuration [
	^ configuration
]

{ #category : #accessing }
BenchDateResult >> configuration: aBenchMulticonfiguration [
	configuration := aBenchMulticonfiguration
]

{ #category : #accessing }
BenchDateResult >> date [
	^ date
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

{ #category : #filter }
BenchDateResult >> selectConfigs: aBlockClosure [ 

	configuration selectConfigs: aBlockClosure 
]
