tests
testBePositive
	self description bePositive.
	self assert: (self description isSatisfiedBy: 1).
	self assert: (self description isSatisfiedBy: 1.5).
	self deny: (self description isSatisfiedBy: -0.1).
	self deny: (self description isSatisfiedBy: -1)