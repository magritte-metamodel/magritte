tests-strings
testFromString
	self shouldSkipStringTests ifTrue: [ ^ self ].
	self assert: (self description
		fromString: self includedInstanceString)
			= self includedInstance.
	self assert: (self description
		fromString: self includedInstanceString
		reader: self description stringReader)
			= self includedInstance.
	self assert: (self description
		fromString: self includedInstanceString
		reader: self description stringReader new)
			= self includedInstance