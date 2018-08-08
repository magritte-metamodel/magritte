*magritte-morph-converting
asMorphOn: anObject
	^ self morphClass
		memento: (anObject mementoClass
			model: anObject
			description: self)