tests-strings
testFromStringCollection
	self shouldSkipStringTests ifTrue: [ ^ self ].
	self assert: (self description
		fromStringCollection: (Array
			with: self includedInstanceString
			with: self includedInstanceString))
				= (Array
					with: self includedInstance
					with: self includedInstance).
	self assert: (self description
		fromStringCollection: (Array
			with: self includedInstanceString
			with: self includedInstanceString)
		reader: self description stringReader)
				= (Array
					with: self includedInstance
					with: self includedInstance)