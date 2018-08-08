private-batch
batchMaxPages
	^ (self cache size / self batchSize)
		ceiling