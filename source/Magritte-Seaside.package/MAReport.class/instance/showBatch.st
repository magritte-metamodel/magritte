accessing-settings
showBatch
	^ properties at: #showBatch ifAbsent: [ self defaultShowBatch ]