*Magritte-Morph
morphClass
	^ self propertyAt: #morphClass ifAbsent: [ self class defaultMorphClass ]