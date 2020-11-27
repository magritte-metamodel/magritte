processing
handleAnswer: anObject continueWith: aBlock
	self decoratedComponent readOnly: true.
	super handleAnswer: anObject continueWith: aBlock