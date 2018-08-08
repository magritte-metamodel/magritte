accessing-settings
showBatchPages
	^ properties at: #showBatchPages ifAbsent: [ self defaultShowBatchPages ]