accessing-settings
sorterStyles
	^ properties at: #sorterStyles ifAbsent: [ self defaultSorterStyles ]