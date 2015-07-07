accessing-properties
sorted
	^ self propertyAt: #sorted ifAbsent: [ self class defaultSorted ]