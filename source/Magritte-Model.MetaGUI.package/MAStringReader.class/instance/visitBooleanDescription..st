visiting-description
visitBooleanDescription: aDescription
	(aDescription trueString = self contents
		or: [ aDescription trueStrings includes: self contents ])
			ifTrue: [ ^ self object: true ].
	(aDescription falseString = self contents
		or: [ aDescription falseStrings includes: self contents ])
			ifTrue: [ ^ self object: false ].
	MAReadError signal