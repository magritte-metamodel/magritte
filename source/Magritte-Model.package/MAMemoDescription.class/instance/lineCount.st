accessing-properties
lineCount
	^ self propertyAt: #lineCount ifAbsent: [ self class defaultLineCount ]