tests-strings
testFromStringNull
	self shouldSkipStringTests ifTrue: [ ^ self ].
	self assert: (self description
		fromString: self emptyInstance) isNil.
	self assert: (self description
		fromString: self emptyInstance
		reader: self description stringReader) isNil.
	self assert: (self description
		fromString: self emptyInstance
		reader: self description stringReader new) isNil