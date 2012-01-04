morphic
callInWorld
	| result |
	result := nil.
	self onAnswer: [ :value | result := value ].
	self openInWorld; waitUntilClosed.
	^ result