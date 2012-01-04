tests-validation
testAddConditionLabelled
	self description
		addCondition: [ :value | value isNil ]
		labelled: 'ist net nil'.

	self assert: self description conditions size = 1.
	self assert: self description conditions first value = 'ist net nil'