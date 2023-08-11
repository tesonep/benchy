"
A benchy history holds a `Collection` of `BenchyConfiguration`s, and it knows how to plot them through the method `BenchyHistory>>plot`.

It can be created using on: and passing a path `String` as argument. The path should contain a CSV file (by default named in `defaultBenchmarkResultsFilename`). The format of the CSV is read by `readBenchmarkEntries` method.

## Example

```language=Pharo
benchyHistory := BenchyHistory on: '/directory/with/csv'
```

Plotting:

```language=Pharo
benchyHistory plot.
```

Check `BenchyTestCase` to see examples of the input CSV file format.
"
Class {
	#name : #BenchyHistory,
	#superclass : #BenchybstractObject,
	#instVars : [
		'benchmarkResultsFilename',
		'benchmarksReadStream',
		'basePath',
		'configurations'
	],
	#category : #'Benchy-Core'
}

{ #category : #adding }
BenchyHistory >> addConfiguration: aBenchConfiguration [

	self configurations add: aBenchConfiguration
]

{ #category : #accessing }
BenchyHistory >> basePath [

	^ basePath
]

{ #category : #accessing }
BenchyHistory >> basePath: aStringOrFileReference [

	basePath := aStringOrFileReference asFileReference
]

{ #category : #benchmarks }
BenchyHistory >> benchmarkResultsFilename [

	^ benchmarkResultsFilename
		ifNil: [ benchmarkResultsFilename := self defaultBenchmarkResultsFilename ]
]

{ #category : #accessing }
BenchyHistory >> benchmarkResultsFilename: anObject [

	benchmarkResultsFilename := anObject
]

{ #category : #benchmarks }
BenchyHistory >> benchmarksReadStream [
	"Answer a <ReadStream> on the input results file"

	^ benchmarksReadStream 
		ifNil: [ benchmarksReadStream :=  (basePath / self benchmarkResultsFilename) readStream ]
]

{ #category : #accessing }
BenchyHistory >> benchmarksReadStream: anObject [

	benchmarksReadStream := anObject
]

{ #category : #plotting }
BenchyHistory >> buildChartFrom: measurementsDictionary canvas: aCanvas [

	| chart timeAveragesPerConfig line deviationArea sampleMeasurementEntry chartShape measurementAtDay legend |
		
	sampleMeasurementEntry := measurementsDictionary anyOne anyOne first.
	measurementAtDay := measurementsDictionary values.
		
	chart := RSChart new.
	chart 
		colors: NSScale google20;
		title: sampleMeasurementEntry measurement;
		addDecoration: RSYMarkerDecoration new average;
		addDecoration: RSVerticalTick new asFloat;
		addDecoration: (RSHorizontalTick new 
			fromNames: ((measurementAtDay collect: #keys) anyOne collect: #asString); 
			useDiagonalLabel; 
			yourself).
	legend := RSLegend new.

	" Add lines to chart "
	timeAveragesPerConfig := measurementsDictionary collect: [ : measurementByConfig |
		measurementByConfig collect: [ : collectionOfBenchmarkEntry | self computeTimeAveragePerDay: collectionOfBenchmarkEntry ] ].

	timeAveragesPerConfig valuesDo: [ : timeAvgPerConfig | 
		line := RSLinePlot new.
		line
			x: (1 to: timeAvgPerConfig size)
			y: (timeAvgPerConfig values collect: #first).
			
		chart addPlot: line.
		line color: line computeColor.

		deviationArea := RSAreaPlot new
			x: (1 to: timeAvgPerConfig size)
			y1: (timeAvgPerConfig values collect: #second)
			y2: (timeAvgPerConfig values collect: #third);
			color: (line color alpha: 0.1);
			yourself. 
		chart addPlot: deviationArea.
		legend ifNotNil: [ legend 
				text: (sampleMeasurementEntry vmName , '-' , sampleMeasurementEntry imageName) 
				withBoxColor: line color ] ].

	legend container: chart canvas.
	legend legendDo: [ :shape | shape scaleBy: 0.6 ].
	legend layout vertical.
	legend location outer; right; offset: 210 @ (-200).
	legend build.

	chartShape := chart build asShape.
	aCanvas add: chartShape.
	^ chartShape
]

{ #category : #plotting }
BenchyHistory >> collectPlotsFrom: measurements canvas: aRSCanvas [
	" Answer a <Collection> of <RSChart> to be plotted in aRSCanvas "

	^ measurements collect: [ : measurementsDictionary | 
		self buildChartFrom: measurementsDictionary canvas: aRSCanvas ].
]

{ #category : #accessing }
BenchyHistory >> configurations [

	^ configurations
]

{ #category : #accessing }
BenchyHistory >> configurations: anObject [

	configurations := anObject
]

{ #category : #benchmarks }
BenchyHistory >> defaultBenchmarkResultsFilename [

	^ 'benchy-runs.csv'
]

{ #category : #adding }
BenchyHistory >> groupMeasurementsByBenchmarkConfigAndDate [
	"Read the receiver's benchmark results in CSV format and group first by the benchmark (slopstone, richards, etc).
	and then group them by configuration (a combination of image and VM) and by date at day precision"

	| entriesByBenchmark entriesByBenchmarkAndConfig |

	entriesByBenchmark := self readBenchmarkEntries groupedBy: [ :e | e measurement ].
	entriesByBenchmark keysAndValuesDo: [ : benchmarkName : entries |
		self addConfiguration: (self newConfigFor: entries named: benchmarkName) ].

	entriesByBenchmarkAndConfig := entriesByBenchmark collect: [ : benchyMeasurement | benchyMeasurement groupedBy: [ : e | e imageName , '-' , e vmName ] ].
	^ entriesByBenchmarkAndConfig collect: [ : byConfigDict | (byConfigDict collect: [ : config | config groupedBy: #dayTime ]) ].
]

{ #category : #initialization }
BenchyHistory >> initialize [

	super initialize.
	self configurations: OrderedCollection new.
]

{ #category : #plotting }
BenchyHistory >> newConfigFor: aCollection named: aString [

	^ BenchyConfiguration new
		configurationName: aString;
		entries: aCollection;
		yourself
]

{ #category : #plotting }
BenchyHistory >> plot [

	| canvas plots measurements |
	canvas := RSCanvas new.

	measurements := self groupMeasurementsByBenchmarkConfigAndDate.
	plots := self collectPlotsFrom: measurements canvas: canvas.

	RSGridLayout on: plots.
	canvas @ RSCanvasController.
	^ canvas
]

{ #category : #benchmarks }
BenchyHistory >> readBenchmarkEntries [
	"Answer a <Collection> of <BenchyMeasurementEntry>"

	^ (NeoCSVReader on: self benchmarksReadStream)
		recordClass: BenchyMeasurementEntry;
		skip: 2;
		separator: $,;
		addField: #measurement:;
		addField: #status:;
		addFloatField: #duration:;
		addIntegerField: #iterationsCount:;
		addField: #imageName:;
		addField: #vmName:;
		addField: #outputFilePath:;
		addField: #errFilePath:;
		addField: #time:;
		upToEnd.
]
