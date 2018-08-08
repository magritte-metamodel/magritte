tests-validation
testAddCondition
	self description
		addCondition: [ :value | value isNil ].

	self assert: self description conditions size = 1.
	self assert: self description conditions first value isString