*magritte-morph-accessing
morphColor
	^ self propertyAt: #morphColor ifAbsent: [ self class defaultMorphColor ]