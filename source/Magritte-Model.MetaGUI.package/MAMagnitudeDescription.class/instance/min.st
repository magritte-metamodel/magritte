accessing
min
	^ self propertyAt: #min ifAbsent: [ self class defaultMin ]