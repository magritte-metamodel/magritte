accessing
max
	^ self propertyAt: #max ifAbsent: [ self class defaultMax ]