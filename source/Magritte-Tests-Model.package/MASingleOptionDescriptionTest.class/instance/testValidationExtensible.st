tests-validation
testValidationExtensible
	self description beLimited.
	self assert: (self description isSatisfiedBy: 'foo').
	self deny: (self description isSatisfiedBy: 'zonk').
	self deny: (self description isSatisfiedBy: 1).
	
	self description beExtensible.
	self assert: (self description isSatisfiedBy: 'foo').
	self assert: (self description isSatisfiedBy: 'zonk').
	self deny: (self description isSatisfiedBy: 1)