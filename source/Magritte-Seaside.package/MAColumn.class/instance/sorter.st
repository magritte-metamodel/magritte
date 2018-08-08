accessing-settings
sorter
	^ self propertyAt: #sorter ifAbsent: [ self defaultSorter ]