morphic
waitUntilClosed
	[ self morph world notNil ]
		whileTrue: [ self morph outermostWorldMorph doOneCycle ]