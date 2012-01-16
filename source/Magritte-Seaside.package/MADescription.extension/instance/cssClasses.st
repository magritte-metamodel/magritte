*magritte-seaside-accessing
cssClasses
	^ self propertyAt: #cssClasses ifAbsent: [ self class defaultCssClasses ]