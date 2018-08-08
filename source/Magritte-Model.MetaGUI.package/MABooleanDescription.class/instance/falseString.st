accessing-properties
falseString
	^ self propertyAt: #falseString ifAbsent: [ self class defaultFalseString ]