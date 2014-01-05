answering
answer: anObject
	answer isNil
		ifFalse: [ answer value: anObject ].
	self morph delete