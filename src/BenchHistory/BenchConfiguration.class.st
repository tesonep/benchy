Class {
	#name : #BenchConfiguration,
	#superclass : #Object,
	#instVars : [
		'bench',
		'config'
	],
	#category : #BenchHistory
}

{ #category : #plotting }
BenchConfiguration >> addToChart: aChart [

	self addToChart: aChart legend: nil
]

{ #category : #plotting }
BenchConfiguration >> addToChart: aChart legend: aLegend [

	| timeAveragePerDay p deviationArea |
	timeAveragePerDay := self computeTimeAveragePerDay.
	p := RSLinePlot new.
	p
		x: (1 to: timeAveragePerDay size)
		y: (timeAveragePerDay collect: #second). "(timeAveragePerDay collect: #first)"
	aChart addPlot: p.
	p color: p computeColor.

	deviationArea := RSAreaPlot new
		                 x: (1 to: timeAveragePerDay size)
		                 y1: (timeAveragePerDay collect: #third)
		                 y2: (timeAveragePerDay collect: #fourth);
		                 color: (p color alpha: 0.1);
		                 yourself. "(timeAveragePerDay collect: #first)"

	aChart addPlot: deviationArea.
	aLegend ifNotNil: [ aLegend text: self name withBoxColor: p color ]
]

{ #category : #computing }
BenchConfiguration >> computeTimeAveragePerDay [

	| datapoints |
	datapoints := self resultFiles.
	^ datapoints collect: [ :e |
		  | times average stdev |
		  times := (NeoCSVReader on: e readStream)
			           separator: Character cr;
			           fieldCount: 1;
			           addFloatFieldRadixPointComma;
			           collect: #first.
		  average := times average.
		  stdev := times stdev.
		  {
			  (self dateForFileReference: e).
			  average.
			  (average + stdev).
			  (average - stdev) } ]
]

{ #category : #accessing }
BenchConfiguration >> dateForFileReference: aFileReference [

	^ aFileReference withoutExtension basename last: 'xxxx-xx-xx' size
]

{ #category : #accessing }
BenchConfiguration >> dates [

	^ self resultFiles collect: [ :e |
		  e withoutExtension basename last: 'xxxx-xx-xx' size ]
]

{ #category : #plotting }
BenchConfiguration >> plot [

	| c |
	c := RSChart new.
	c title: bench name.
	c colors: NSScale google20.
	self addToChart: c.
	c addDecoration: (RSHorizontalTick new fromNames: self dates; useDiagonalLabel; yourself).
	c addDecoration: RSVerticalTick new asFloat.
	c addDecoration: RSYMarkerDecoration new average.
	^ c
]

{ #category : #accessing }
BenchConfiguration >> resultFiles [

	| directory |
	directory := self root fileReference
	             / (bench name , '-' , (config joinUsing: '-')).
	^ (directory children select: [ :e | e extension = 'csv' ]) sorted: [
		  :a
		  :b |
		  (self dateForFileReference: a) < (self dateForFileReference: b) ]
]
