tests-strings
testToStringUndefined
	self shouldSkipStringTests ifTrue: [ ^ self ].
	self description undefined: 'n/a'.
	self assert: (self description
		toString: self nullInstance)
			= 'n/a'.
	self assert: (self description
		toString: self nullInstance
		writer: self description stringWriter)
			= 'n/a'.
	self assert: (self description
		toString: self nullInstance
		writer: self description stringWriter new)
			= 'n/a'