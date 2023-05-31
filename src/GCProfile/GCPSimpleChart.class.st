Class {
	#name : #GCPSimpleChart,
	#superclass : #GCChart,
	#instVars : [
		'profiles',
		'showFullGC',
		'extraMarkers'
	],
	#category : #GCProfile
}

{ #category : #configure }
GCPSimpleChart >> addExtraMarker: aDecoration [

	extraMarkers add: aDecoration
]

{ #category : #configure }
GCPSimpleChart >> addProfile: aFileReference named: name [

	profiles at: name put: aFileReference
]

{ #category : #initialization }
GCPSimpleChart >> initialize [

	super initialize.
	profiles := OrderedDictionary new.
	extraMarkers := OrderedCollection new.
	showFullGC := false.
	
]

{ #category : #plot }
GCPSimpleChart >> plotFullGC: aFileReference named: name [

	| trace n fullGCs chart plot |
	trace := self loadGCLogFrom: aFileReference.

	n := 0.
	fullGCs := trace collect: [ :e |
		           (e className includesSubstring: 'FullGC') ifTrue: [
			           n := e fullGCs ].
		           n ].



	chart := RSChart new.

	plot := RSLinePlot new
		        color: Color black;
		        x: (1 to: fullGCs size) y: fullGCs.

	chart addPlot: plot.

	self addTicks: (5 min: fullGCs max + 1) toChart: chart.

	chart ylabel: 'FullGCs'.
	chart xlabel: 'Scavenges'.
	chart title: name.

	chart build.


	^ chart canvas
]

{ #category : #plot }
GCPSimpleChart >> plotFullGCs [

	| plots |
	plots := profiles associations collect: [ :tuple |
		         self plotFullGC: tuple value named: tuple key ].

	^ self multiPlotWith: plots
]

{ #category : #plot }
GCPSimpleChart >> plotGCProfile: aFileReference named: name [

	| trace |
	trace := self loadGCLogFrom: aFileReference.
	^ self plotScavenge: { name } , trace
]

{ #category : #plot }
GCPSimpleChart >> plotGCProfiles [

	| plots |
	plots := profiles associations collect: [ :tuple |
		         self plotGCProfile: tuple value named: tuple key ].

	^ self multiPlotWith: plots
]

{ #category : #'as yet unclassified' }
GCPSimpleChart >> plotScavenge: trace [

	| chart plot y scavenges fullGCs tenures scavengesAndFullGCs markers |
	scavengesAndFullGCs := trace allButFirst.
	scavenges := scavengesAndFullGCs select: [ :e |
		             e className includesSubstring: 'Scavenge' ].
	fullGCs := scavengesAndFullGCs select: [ :e |
		           e className includesSubstring: 'FullGC' ].
	tenures := scavenges collect: [ :e | e tTenureThreshold // 1000 ].

	y := scavenges collect: [ :e | e eSurvivorBytes // 1000 ].


	chart := RSChart new.

	plot := RSLinePlot new
		        color: Color black;
		        x: (1 to: scavenges size) y: y.

	chart addPlot: plot.

	tenures doWithIndex: [ :bytes :i |
		bytes > 0 ifTrue: [
			chart addPlot: (RSScatterPlot new x: { i } y: { bytes }) ] ].


	self addTicks: 8 toChart: chart.

	showFullGC ifTrue: [
		markers := OrderedCollection new.
		fullGCs doWithIndex: [ :e :i |
			| x marker |
			x := (scavengesAndFullGCs indexOf: e) - i.
			marker := (RSXMarkerDecoration new atValue: x) color: Color red.
			markers add: marker.
			chart addDecoration: marker ] ].

	extraMarkers do: [ :marker | chart addDecoration: marker ].


	chart ylabel: 'Survivors [KB]'.
	chart xlabel: 'Scavenges'.
	chart title: trace first.

	chart build.


	showFullGC ifTrue: [
		markers allButFirst doWithIndex: [ :m :i |
			m lines do: [ :line |
				| label text |
				text := (fullGCs at: i + 1) fullUsecs - (fullGCs at: i) fullUsecs.
				label := RSLabel new
					         text: text // 1000;
					         color: Color red;
					         fontSize: 6;
					         yourself.
				RSLocation new
					above;
					move: label on: line.
				chart canvas add: label ] ] ].


	^ chart canvas
]

{ #category : #plot }
GCPSimpleChart >> plotScavengeTime: aFileReference named: name [

	| trace scavenges uSecs rememberedSize chart plot |
	trace := self loadGCLogFrom: aFileReference.
	scavenges := trace select: [ :e |
		             e className includesSubstring: 'Scavenge' ].
	uSecs := scavenges collect: [ :e | e deltaUsecs // 1000 "ms" ].
	rememberedSize := scavenges collect: [ :e | e eRememberedSetSize ].


	chart := RSChart new.

	plot := RSLinePlot new
		        color: Color black;
		        x: (1 to: scavenges size) y: uSecs.

	chart addPlot: plot.

	self addTicks: 5 toChart: chart.

	chart ylabel: 'Time [ms]'.
	chart xlabel: 'Scavenges'.
	chart title: name.

	chart build.

	^ chart canvas
]

{ #category : #plot }
GCPSimpleChart >> plotScavengeTimes [

	| plots |
	plots := profiles associations collect: [ :tuple |
		         self plotScavengeTime: tuple value named: tuple key ].

	^ self multiPlotWith: plots
]

{ #category : #configure }
GCPSimpleChart >> showFullGC: aBoolean [ 

	showFullGC := aBoolean 
]
