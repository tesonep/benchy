Class {
	#name : #GCPMultiChart,
	#superclass : #GCChart,
	#instVars : [
		'profiles'
	],
	#category : #GCProfile
}

{ #category : #configure }
GCPMultiChart >> addProfile: edenSizesWithFiles forApplication: name [

	profiles at: name put: edenSizesWithFiles
]

{ #category : #initialization }
GCPMultiChart >> initialize [

	super initialize.
	profiles := OrderedDictionary new
]

{ #category : #plot }
GCPMultiChart >> multiPlot: selectors [

	| c shapes |
	c := RSCanvas new.

	shapes := selectors collect: [ :s |
		          | plot shape |
		          plot := self perform: s.
		          c add: (shape := plot asShape).
		          shape ].

	(RSGridLayout
		withGap: 30)
		on: shapes.
	c @ RSCanvasController.
	^ c
]

{ #category : #plot }
GCPMultiChart >> plotGCPasses [

	| chart legend |
	chart := RSChart new.
	legend := RSLegend new.

	profiles associations sorted do: [ :tuple |	| name edenSizesWithFiles data plot |
		name := tuple key.
		edenSizesWithFiles := tuple value.
		data := edenSizesWithFiles sorted asOrderedDictionary collect: [ :file |
			        | trace |
			        trace := self loadGCLogFrom: file.
			        trace size ].
		chart
			addPlot: (plot := RSLinePlot new x: data keys y: data values);
			addPlot: (RSScatterPlot new x: data keys y: data values).

		legend text: name withBoxColor: plot computeColor ].

	self addTicks: 5 toChart: chart.
			
	self addLegend: legend toChart: chart.


	chart xlabel: 'Eden size [MB]'.
	chart ylabel: 'Number of GC passes'.
	chart title: 'Number of Scavenges and FullGC based on Eden size'.
	^ chart
]

{ #category : #plot }
GCPMultiChart >> plotGCRatio [

	| chart legend data plot |
	chart := RSChart new.
	legend := RSLegend new.


	self profilesDo: [ :name :ratiosWithFiles |
		data := ratiosWithFiles sorted asOrderedDictionary collect: [ :file |
			        | trace fullGCs |
			        trace := self loadGCLogFrom: file.
			        fullGCs := trace select: [ :e |
				                   e className includesSubstring: 'FullGC' ].
			        fullGCs size ].

		chart
			addPlot: (plot := RSLinePlot new x: data keys y: data values);
			addPlot: (RSScatterPlot new x: data keys y: data values).

		legend text: name withBoxColor: plot computeColor ].

	self addTicks: 5 toChart: chart.


	legend container: chart canvas.
	legend legendDo: [ :shape | shape scaleBy: 0.6 ].
	legend layout vertical.
	legend location
		outer;
		right;
		offset: 210 @ -200.
	legend build.


	chart xlabel: 'FullGC ratio [% of memory]'.
	chart ylabel: 'Number of FullGC passes'.
	chart title: 'FullGC passes based on FullGC ratio threshold'.
	^ chart
]

{ #category : #plot }
GCPMultiChart >> plotHeadroom [

		| chart legend data plot |
	chart := RSChart new.
	legend := RSLegend new.


	self profilesDo: [ :name :ratiosWithFiles |
		data := ratiosWithFiles sorted asOrderedDictionary collect: [ :file |
			        | trace fullGCs |
			        trace := self loadGCLogFrom: file.
			        fullGCs := trace select: [ :e |
				                   e className includesSubstring: 'FullGC' ].
			        fullGCs size ].

		chart
			addPlot: (plot := RSLinePlot new x: data keys y: data values);
			addPlot: (RSScatterPlot new x: data keys y: data values).

		legend text: name withBoxColor: plot computeColor ].

	self addTicks: 5 toChart: chart.


	legend container: chart canvas.
	legend legendDo: [ :shape | shape scaleBy: 0.6 ].
	legend layout vertical.
	legend location
		outer;
		right;
		offset: 210 @ -200.
	legend build.


	chart xlabel: 'Grow headroom [MB]'.
	chart ylabel: 'Number of FullGC passes'.
	chart title: 'FullGC based on Grow headroom creating 100 objects of 24MB each'.

	^ chart
]

{ #category : #plot }
GCPMultiChart >> plotScavengeTime [

	| chart legend |
	chart := RSChart new.
	legend := RSLegend new.

	profiles associations sorted do: [ :tuple |	| name edenSizesWithFiles data plot |
		name := tuple key.
		edenSizesWithFiles := tuple value.
		data := edenSizesWithFiles sorted asOrderedDictionary collect: [
			        :file | | trace scavenges total |
			        trace := self loadGCLogFrom: file.
			        scavenges := trace select: [ :e |
				                     e className includesSubstring: 'Scavenge' ].
			        total := scavenges sum: [ :e | e deltaUsecs ].
					  total > 300000 ifTrue: [ total // 10 ] ifFalse: [ total ] ].

		chart
			addPlot: (plot := RSLinePlot new x: data keys y: data values);
			addPlot: (RSScatterPlot new x: data keys y: data values).

		legend text: name withBoxColor: plot computeColor ].


	chart addDecoration: (RSHorizontalTick new
			 numberOfTicks: 5;
			 fontSize: 7;
			 labelConversion: [ :e | e asInteger printString ];
			 yourself).
	chart addDecoration: (RSVerticalTick new
			 numberOfTicks: 5;
			 fontSize: 7;
			 labelConversion: [ :e | (e // 1000) printString ];
			 yourself).

	self addLegend: legend toChart: chart.

	chart xlabel: 'Eden size [MB]'.
	chart ylabel: 'Total Scavenge time [ms]'.
	chart title: 'Scavenge time based on Eden size'.
	^ chart
]

{ #category : #plot }
GCPMultiChart >> plotTenuredData [

		| chart legend |
	chart := RSChart new.
	legend := RSLegend new.

	profiles associations sorted do: [ :tuple |	| name edenSizesWithFiles data plot |
		name := tuple key.
		edenSizesWithFiles := tuple value.
		data := edenSizesWithFiles sorted asOrderedDictionary collect: [
			        :file | | trace scavenges total |
			        trace := self loadGCLogFrom: file.
			        scavenges := trace select: [ :e |
				                     e className includesSubstring: 'Scavenge' ].
			        total := scavenges sum: [ :e | e deltaTenured ].
			total := total > 200000 ifTrue: [ total // 10 ]  ifFalse: [ total ].
					  total // 1000 ].

		chart
			addPlot: (plot := RSLinePlot new x: data keys y: data values);
			addPlot: (RSScatterPlot new x: data keys y: data values).

		legend text: name withBoxColor: plot computeColor ].


	chart addDecoration: (RSHorizontalTick new
			 numberOfTicks: 5;
			 fontSize: 7;
			 labelConversion: [ :e | e asInteger printString ];
			 yourself).
	chart addDecoration: (RSVerticalTick new
			 numberOfTicks: 5;
			 fontSize: 7;
			 labelConversion: [ :e | e asInteger printString ];
			 yourself).

	self addLegend: legend toChart: chart.

	chart xlabel: 'Survivors to keep [thousands of objects]'.
	chart ylabel: 'Tenured data size [KB]'.
	chart title: 'Amount of data tenured based on survivors to keep parameter'.
	^ chart
]

{ #category : #helper }
GCPMultiChart >> profilesDo: binaryBlock [

	profiles associations sorted do: [ :tuple |
		binaryBlock value: tuple key value: tuple value ]
]
