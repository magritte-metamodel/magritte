accessing-settings
showFooter
	^ properties at: #showFooter ifAbsent: [ self defaultShowFooter ]