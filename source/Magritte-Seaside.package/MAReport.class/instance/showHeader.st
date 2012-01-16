accessing-settings
showHeader
	^ properties at: #showHeader ifAbsent: [ self defaultShowHeader ]