tests-strings
testToStringCollection
	self shouldSkipStringTests ifTrue: [ ^ self ].
	self assert: (self description
		toStringCollection: (Array
			with: self includedInstance
			with: self includedInstance))
				= (Array
					with: self includedInstanceString
					with: self includedInstanceString).
	self assert: (self description
		toStringCollection: (Array
			with: self includedInstance
			with: self includedInstance)
		writer: self description stringWriter)
			= (Array
				with: self includedInstanceString
				with: self includedInstanceString)