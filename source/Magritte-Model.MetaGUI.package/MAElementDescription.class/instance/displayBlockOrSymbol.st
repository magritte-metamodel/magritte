accessing-properties
displayBlockOrSymbol
	^self propertyAt: #displayBlockOrSymbol ifAbsent: [ self class defaultDisplayProperty ]