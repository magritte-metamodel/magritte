accessing-properties
displayBlock
	^self propertyAt: #displayBlock ifAbsent: [ self class defaultDisplayBlock ]