Class {
	#name : #BenchMulticonfiguration,
	#superclass : #BenchConfiguration,
	#instVars : [
		'configurations'
	],
	#category : #BenchHistory
}

{ #category : #plotting }
BenchMulticonfiguration >> addToChart: aChart legend: aLegend [

	configurations do: [ :e | e addToChart: aChart legend: aLegend ]
]

{ #category : #accessing }
BenchMulticonfiguration >> configurations [
	^ configurations
]

{ #category : #initialization }
BenchMulticonfiguration >> initialize [
	super initialize.
	configurations := OrderedCollection new
]
