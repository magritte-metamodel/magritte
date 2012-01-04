tests
testValToVal
	self description min: self includedInstance.
	self description max: self includedInstance.

	self assert: self description min = self includedInstance.
	self assert: self description max = self includedInstance.

	self deny: (self description isSatisfiedBy: self minInstance).
	self assert: (self description isSatisfiedBy: self includedInstance).
	self deny: (self description isSatisfiedBy: self maxInstance)