accessing-properties
ordered
	^ self propertyAt: #ordered ifAbsent: [ self class defaultOrdered ]