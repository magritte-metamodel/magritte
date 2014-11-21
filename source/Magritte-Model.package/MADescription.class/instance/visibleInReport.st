accessing-properties
visibleInReport

	^properties at: #visibleInReport ifAbsent: [ self class defaultVisibleInReport ]