tests-strings
testToStringNull
	self shouldSkipStringTests ifTrue: [ ^ self ].
	self assert: (self description
		toString: self nullInstance)
			= self description undefined.
	self assert: (self description
		toString: self nullInstance
		writer: self description stringWriter)
			= self description undefined.
	self assert: (self description
		toString: self nullInstance
		writer: self description stringWriter new)
			= self description undefined