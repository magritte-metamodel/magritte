tests-strings
testToStringFromString
	self shouldSkipStringTests ifTrue: [ ^ self ].
	self assert: (self description
		fromString: (self description
			toString: self includedInstance))
				= self includedInstance.
	self assert: (self description
		fromString: (self description
			toString: self includedInstance
			writer: self description stringWriter)
		reader: self description stringReader)
				= self includedInstance.
	self assert: (self description
		fromString: (self description
			toString: self includedInstance
			writer: self description stringWriter new)
		reader: self description stringReader new)
				= self includedInstance