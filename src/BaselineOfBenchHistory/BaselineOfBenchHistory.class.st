Class {
	#name : #BaselineOfBenchHistory,
	#superclass : #BaselineOf,
	#category : #BaselineOfBenchHistory
}

{ #category : #baselines }
BaselineOfBenchHistory >> baseline: spec [
	<baseline>
	spec
			for: #common
			do: [ 
			spec
				"Dependencies"
				baseline: 'NeoCSV' with: [ spec repository: 'github://svenvc/NeoCSV/repository' ];
				baseline: 'Roassal3' with: [ spec repository: 'github://ObjectProfile/Roassal3/src' ];
				
				"Package"
				package: 'BenchHistory'
			 ]
]
