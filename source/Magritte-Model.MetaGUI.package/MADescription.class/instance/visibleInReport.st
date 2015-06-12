accessing-properties
visibleInReport

	^self propertyAt: #visibleInReport ifAbsent: [ self class defaultVisibleInReport ]