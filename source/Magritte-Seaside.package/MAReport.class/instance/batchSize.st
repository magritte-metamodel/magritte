accessing-settings
batchSize
	^ properties at: #batchSize ifAbsent: [ self defaultBatchSize ]