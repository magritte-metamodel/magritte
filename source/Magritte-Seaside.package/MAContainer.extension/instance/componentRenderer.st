*magritte-seaside-accessing
componentRenderer
	^ self propertyAt: #componentRenderer ifAbsent: [ self class defaultComponentRenderer ]