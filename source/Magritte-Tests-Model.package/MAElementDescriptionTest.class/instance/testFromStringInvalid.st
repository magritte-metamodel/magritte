tests-strings
testFromStringInvalid
	self shouldSkipStringTests ifTrue: [ ^ self ].
	self
		should: [ self description fromString: self invalidInstanceString ]
		raise: MAReadError