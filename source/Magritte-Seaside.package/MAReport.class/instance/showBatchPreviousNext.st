accessing-settings
showBatchPreviousNext
	^ properties at: #showBatchPreviousNext ifAbsent: [ self defaultShowBatchPreviousNext ]