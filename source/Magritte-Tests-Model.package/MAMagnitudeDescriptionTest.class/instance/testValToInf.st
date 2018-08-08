tests
testValToInf
	self description min: self includedInstance.

	self assert: self description min = self includedInstance.
	self assert: self description max isNil.

	self deny: (self description isSatisfiedBy: self minInstance).
	self assert: (self description isSatisfiedBy: self includedInstance).
	self assert: (self description isSatisfiedBy: self maxInstance)