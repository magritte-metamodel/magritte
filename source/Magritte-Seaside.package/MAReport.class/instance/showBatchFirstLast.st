accessing-settings
showBatchFirstLast
	^ properties at: #showBatchFirstLast ifAbsent: [ self defaultShowBatchFirstLast ]