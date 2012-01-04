accessing-properties
definitive
	^ self propertyAt: #definitive ifAbsent: [ self class defaultDefinitive ]