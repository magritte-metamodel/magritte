acessing-magritte
lineCount
	^ self propertyAt: #lineCount ifAbsent: [ self class defaultLineCount ]