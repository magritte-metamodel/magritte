*magritte-morph-accessing
morphClass
	^ self propertyAt: #morphClass ifAbsent: [ self class defaultMorphClass ]