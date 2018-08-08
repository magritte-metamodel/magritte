accessing
selection
	selection isNil
		ifTrue: [ self selection: self defaultSelection ].
	^ selection