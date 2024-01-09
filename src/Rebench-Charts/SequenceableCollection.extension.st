Extension { #name : #SequenceableCollection }

{ #category : #'*Rebench-Charts' }
SequenceableCollection >> foursDo: aBlock [
	"See #pairsDo: method"
	
	1 to: self size // 4 do: [ :index | aBlock value: (self at: 4 * index - 3) value: (self at: 4 * index - 2) value: (self at: 4 * index - 1) value: (self at: 4 * index) ]
]

{ #category : #'*Rebench-Charts' }
SequenceableCollection >> legsDo: aBlock [
	"See #pairsDo: method"
	
	1 to: self size // 3 do: [ :index | aBlock value: (self at: 3 * index - 2) value: (self at: 3 * index - 1) value: (self at: 3 * index) ]
]
