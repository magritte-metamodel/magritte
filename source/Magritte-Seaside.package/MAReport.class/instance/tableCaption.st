accessing-settings
tableCaption
	^ properties at: #tableCaption ifAbsent: [ self defaultTableCaption ]