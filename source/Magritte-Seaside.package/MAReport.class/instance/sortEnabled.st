accessing-settings
sortEnabled
	^ properties at: #sortEnabled ifAbsent: [ self defaultSortEnabled ]