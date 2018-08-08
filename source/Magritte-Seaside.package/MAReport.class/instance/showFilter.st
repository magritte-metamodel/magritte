accessing-settings
showFilter
	^ properties at: #showFilter ifAbsent: [ self defaultShowFilter ]