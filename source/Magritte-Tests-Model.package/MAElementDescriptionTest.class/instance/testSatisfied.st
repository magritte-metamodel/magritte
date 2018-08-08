tests-testing
testSatisfied
	self assert: (self description isSatisfiedBy: self includedInstance).
	self assert: (self description isSatisfiedBy: self nullInstance).
	self deny: (self description isSatisfiedBy: self invalidInstance)