accessing-settings
batchPage
	^ backtracked at: #batchPage ifAbsentPut: [ self defaultBatchPage ]