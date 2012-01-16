*magritte-seaside-converting
asComponentOn: anObject
	^ self componentClass
		memento: (anObject mementoClass
			model: anObject
			description: self)