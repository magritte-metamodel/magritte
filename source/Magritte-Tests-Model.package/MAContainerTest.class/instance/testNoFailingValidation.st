tests-validating
testNoFailingValidation
	| example |
	self description
		add: self child1;
		add: self child2.
	example := self exampleInstance.
	self
		shouldnt: [ example validate ]
		raise: MAValidationError