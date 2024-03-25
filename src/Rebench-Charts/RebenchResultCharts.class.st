Class {
	#name : #RebenchResultCharts,
	#superclass : #Object,
	#instVars : [
		'data'
	],
	#category : #'Rebench-Charts'
}

{ #category : #statistics }
RebenchResultCharts class >> means: aFileReference [

	^ self new
		  parseData: aFileReference;
		  means
]

{ #category : #plot }
RebenchResultCharts class >> plotBuildTime: aFileReference [

	^ self new
		  parseData: aFileReference;
		  plotBuildTime
]

{ #category : #plot }
RebenchResultCharts class >> plotExecutionTime: aFileReference [

	^ self new
		  parseData: aFileReference;
		  plotExecutionTime
		
]

{ #category : #'as yet unclassified' }
RebenchResultCharts >> averageFor: aKey [

	^ (data at: aKey) average
]

{ #category : #data }
RebenchResultCharts >> means [
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
RebenchResultCharts >> parseData: dataFile [

	| headerLines rawData preproccessed |
	headerLines := dataFile contents lines count: [ :l |
		               l beginsWith: '#' ].
	rawData := (NeoCSVReader on: dataFile readStream)
		           skip: headerLines;
		           separator: Character tab;
		           recordClass: Dictionary;
		           readHeader;
		           addIntegerFieldAt: 'invocation';
		           addIntegerFieldAt: 'iteration';
		           addFloatFieldAt: 'time';
		           addFieldAt: 'unit';
		           addFieldAt: 'user';
		           addFieldAt: 'bench';
		           addFieldAt: 'vm';
		           addFieldAt: 'suite';
		           "addFloatField;""collect: #first."upToEnd.





	preproccessed := (rawData
		                  select: [ :d | (d at: #user) = 'total' ]
		                  thenCollect: [ :d |
			                  ('-' join: {
					                   (d at: #suite).
					                   (d at: #bench).
					                   (d at: #vm) }) -> (d at: #time) ]) sorted.


	data := (preproccessed groupedBy: #key) collect: [ :col |
		        col collect: #value ].
	^ data
]

{ #category : #plots }
RebenchResultCharts >> plotBuildTime [

	| c druidBuildTime preBuildTimes druidSlangTime jitSlangTime slangTimes druidCompileTime jitCompileTime compileTimes legend |
	druidBuildTime := self averageFor:
		                  'RunDruid-DRInterpreterToCompiler generateDruidJITModel-Latest10'.

	preBuildTimes := {
		                 druidBuildTime.
		                 0 "Handwritten version has not pre-pass" }.


	druidSlangTime := (data at:
		                   'RunSlang-PharoVMMaker generate: #DruidVM-Latest10')
		                  average.
	jitSlangTime := (data at:
		                 'RunSlang-PharoVMMaker generate: #JITVM-Latest10')
		                average.

	slangTimes := {
		              druidSlangTime.
		              jitSlangTime }.


	druidCompileTime := (data at: 'CompileDruid-DruidVM-Make') average.

	jitCompileTime := (data at: 'CompileJIT-JITVM-Make') average.

	compileTimes := {
		                druidCompileTime.
		                jitCompileTime }.




	c := RSCompositeChart new.
	c ylabel: 'Time [sec]'.
	c add: (RSAbstractChart barHeights: preBuildTimes).
	c add:
		((RSAbstractChart barHeights: slangTimes) bottom: preBuildTimes).
	c add:
		((RSAbstractChart barHeights: compileTimes) bottom: slangTimes).
	c horizontalTick fromNames: #( DruidVM HandwrittenVM ).
	c verticalTick
		numberOfTicks: 10;
		useNiceLabel;
		labelConversion: [ :ms | ms // 1000 ].
	c build.

	legend := RSLegend new.
	#( Druid Slang GCC ) doWithIndex: [ :lbl :index |
		legend text: lbl withBoxColor: (c plots at: index) computeColor ].
	legend container: c canvas.
	legend location
		outer;
		top;
		right;
		offset: 20 @ 60.

	legend build.
	^ c canvas
]

{ #category : #'as yet unclassified' }
RebenchResultCharts >> plotExecutionTime [

	| relative canvas colors legend targetVMs dataToPlot |
	targetVMs := #( Druid DruidFull DruidPartial Stack ).

	relative := OrderedDictionary new.
	dataToPlot := data associations select: [ :e |
		              targetVMs includes: ('-' split: e key) last ].

	dataToPlot foursDo: [ :druid :druidFull :druidPartial :stack |
		relative at: druid key put: stack value / druid value.
		relative at: druidFull key put: stack value / druidFull value.
		relative at: druidPartial key put: stack value / druidPartial value.
		relative at: stack key put: stack value / stack value average ].



	"	data associations foursDo: [ :druid :latest :stack :zero |
		relative at: stack key put: stack value / stack value average.
		relative at: latest key put: stack value / latest value.
		relative at: druid key put: stack value / druid value ].
"

	canvas := RSCanvas new.
	"	canvas title: 'Speedup relative to only interpreted VM (higher is better)'."

	"	relative associations legsDo: [ :stack :latest :druid |
		| benchChart |
		benchChart := (RSBoxPlot data: stack value)
		              + (RSBoxPlot data: latest value)
		              + (RSBoxPlot data: druid value).
		benchChart horizontalTick fromNames:
			{ (stack key copyReplaceAll: '-Stack' with: '') }.
		benchChart addDecoration: (RSYMarkerDecoration new value: 1).
		colors := benchChart plots collect: #computeColor.
		canvas add: benchChart asShape ].
"
	relative associations foursDo: [ :druid :druidFull :druidPartial :stack |
		| benchChart |
		benchChart := (RSBoxPlot data: stack value)
		              + (RSBoxPlot data: druid value)
		              + (RSBoxPlot data: druidPartial value)
		              + (RSBoxPlot data: druidFull value).
		benchChart horizontalTick fromNames:
			{ (stack key copyReplaceAll: '-Stack' with: '') }.
		benchChart addDecoration: (RSYMarkerDecoration new value: 1).
		colors := benchChart plots collect: #computeColor.
		canvas add: benchChart asShape ].



	(RSGridLayout withGap: 25) on: canvas shapes.
	canvas @ RSCanvasController.


	legend := RSLegend new.
	#( Stack DruidOld DruidPartial DruidFull ) doWithIndex: [ :lbl :index |
		legend text: lbl withBoxColor: (colors at: index) ].
	legend container: canvas.
	legend legendDo: [ :shape |
		shape
			withBorder;
			padding: 10;
			scaleBy: 2.5 ].
	legend location
		outer;
		top;
		right;
		offset: 20 @ 180.
	legend build.

	^ canvas
]
