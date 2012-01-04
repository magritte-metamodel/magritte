morphic
callInHand
	| result |
	result := nil.
	self onAnswer: [ :value | result := value ].
	self openInHand; waitUntilClosed.
	^ result