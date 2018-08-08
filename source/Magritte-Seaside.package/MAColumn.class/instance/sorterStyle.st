accessing
sorterStyle
	^ self isSorted
		ifTrue: [
			self isReversed
				ifTrue: [ self report sorterStyles second ]
				ifFalse: [ self report sorterStyles first ] ]
		ifFalse: [ String new ]