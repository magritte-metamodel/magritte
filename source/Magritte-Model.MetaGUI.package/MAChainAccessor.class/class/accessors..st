instance creation
accessors: aSequenceableCollection
	aSequenceableCollection isEmpty
		ifTrue: [ self error: 'Unable to create accessor sequence from empty collection.' ].
	aSequenceableCollection size = 1
		ifTrue: [ ^ aSequenceableCollection first asAccessor ].
	^ self 
		on: aSequenceableCollection first asAccessor 
		accessor: (self accessors: aSequenceableCollection allButFirst)