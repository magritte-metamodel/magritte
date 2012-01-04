tests-strings
testToString
	self shouldSkipStringTests ifTrue: [ ^ self ].
	self assert: (self description
		toString: self includedInstance)
			= self includedInstanceString.
	self assert: (self description
		toString: self includedInstance
		writer: self description stringWriter)
			= self includedInstanceString.
	self assert: (self description
		toString: self includedInstance
		writer: self description stringWriter new)
			= self includedInstanceString