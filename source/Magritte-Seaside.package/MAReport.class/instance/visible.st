accessing-readonly
visible
	^ self showBatch
		ifFalse: [ self cache ]
		ifTrue: [
			self cache
				copyFrom: self batchStartIndex
				to: self batchEndIndex ]