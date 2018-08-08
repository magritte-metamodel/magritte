accessing-settings
showSummary
	^ properties at: #showSummary ifAbsent: [ self defaultShowSummary ]