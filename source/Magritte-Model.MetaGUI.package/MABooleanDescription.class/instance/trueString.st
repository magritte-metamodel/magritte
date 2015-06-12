accessing-properties
trueString
	^ self propertyAt: #trueString ifAbsent: [ self class defaultTrueString ]