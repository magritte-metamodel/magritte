tests-strings
testFromString
	self shouldSkipStringTests ifTrue: [ ^ self ].
	self assert: (self description
		fromString: self includedInstanceString)
			equals: self includedInstance.
	self assert: (self description
		fromString: self includedInstanceString
		reader: self description stringReader)
			equals: self includedInstance.
	self assert: (self description
		fromString: self includedInstanceString
		reader: self description stringReader new)
			equals: self includedInstance