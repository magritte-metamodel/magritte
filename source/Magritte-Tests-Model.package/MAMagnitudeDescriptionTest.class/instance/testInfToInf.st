tests
testInfToInf
	self assert: self description min isNil.
	self assert: self description max isNil.

	self assert: (self description isSatisfiedBy: self minInstance).
	self assert: (self description isSatisfiedBy: self includedInstance).
	self assert: (self description isSatisfiedBy: self maxInstance)