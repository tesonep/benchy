Class {
	#name : 'BaselineOfBenchHistory',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfBenchHistory',
	#package : 'BaselineOfBenchHistory'
}

{ #category : 'baselines' }
BaselineOfBenchHistory >> baseline: spec [
	<baseline>
	spec
			for: #common
			do: [ 
			spec
				"Dependencies"
				baseline: 'NeoCSV' with: [ spec repository: 'github://svenvc/NeoCSV/repository' ];
				baseline: 'Roassal3' with: [ spec
					repository: 'github://ObjectProfile/Roassal3';
					loads: 'Full' ];
				
				"Packages"
				package: 'Benchy' with: [ spec requires: #('NeoCSV' 'Roassal3') ];
				package: 'Benchy-Tests' with: [ spec requires: #('Benchy') ];
				package: 'GCProfile' with: [ spec requires: #('Roassal3') ];
				
				"Groups"
				group: 'Tests' with: #('Benchy-Tests' );
				group: 'All' with: #('Benchy' 'Benchy-Tests' 'GCProfile');
				group: 'default' with: #('Benchy') ]
]
