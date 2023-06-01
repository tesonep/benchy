Class {
	#name : #GCChart,
	#superclass : #Object,
	#category : #GCProfile
}

{ #category : #factory }
GCChart class >> multi [

	^ GCPMultiChart new
]

{ #category : #factory }
GCChart class >> simple [

	^ GCPSimpleChart new
]

{ #category : #plot }
GCChart >> addLegend: legend toChart: chart [

	legend container: chart canvas.
	legend legendDo: [ :shape | shape scaleBy: 0.6 ].
	legend layout vertical.
	legend location
		outer;
		right;
		offset: 210 @ -200.
	legend build
]

{ #category : #plot }
GCChart >> addTicks: nTicks toChart: chart [

	| fontSize |
	fontSize := 7.

	chart addDecoration: (RSHorizontalTick new
			 numberOfTicks: nTicks;
			 fontSize: fontSize;
			 labelConversion: [ :e | e asInteger printString ];
			 yourself).
	chart addDecoration: (RSVerticalTick new
			 numberOfTicks: nTicks;
			 fontSize: fontSize;
			 labelConversion: [ :e | e asInteger printString ];
			 yourself)
]

{ #category : #private }
GCChart >> loadGCLogFrom: fileReference [

	| lines |
	lines := '---' split: fileReference contents.
	^ lines allButLast collect: [ :ston | STON fromString: ston ]
]

{ #category : #plot }
GCChart >> multiPlotWith: plots [

	| c shapes |
	c := RSCanvas new.

	shapes := plots collect: [ :plot |
		          | shape |
		          c add: (shape := plot asShape).
		          shape ].

	(RSGridLayout withGap: 30) on: shapes.
	c @ RSCanvasController.
	^ c
]

{ #category : #'as yet unclassified' }
GCChart >> plotAllScavengesIn: logFiles [

	| c shapes |
	c := RSCanvas new.
	
	shapes := logFiles collect: [ :f |
		          | trace plotName plot shape |
		          trace := self loadGCLogFrom: f.
		          plotName := f path segments last.
		          plot := self plotScavenge: { plotName } , trace.
		          c add: (shape := plot asShape).
		          shape ].

	RSGridLayout on: shapes.
	c @ RSCanvasController.
	^ c
]
