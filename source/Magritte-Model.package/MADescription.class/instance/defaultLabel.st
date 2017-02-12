acessing-magritte
defaultLabel
	^ self accessor defaultLabel
		ifNil: [ self class defaultLabel ]
		ifNotNil: [ :label | label ].