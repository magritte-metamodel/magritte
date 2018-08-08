*magritte-seaside-accessing
cssClass: aString
	(self propertyAt: #cssClasses ifAbsentPut: [ self class defaultCssClasses ])
		add: aString