accessing-settings
tableEmpty
	^ properties at: #tableEmpty ifAbsent: [ self defaultTableEmpty ]