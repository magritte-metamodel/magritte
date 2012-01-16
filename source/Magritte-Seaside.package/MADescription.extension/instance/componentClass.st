*magritte-seaside-accessing
componentClass
	^ self propertyAt: #componentClass ifAbsent: [ self class defaultComponentClass ]