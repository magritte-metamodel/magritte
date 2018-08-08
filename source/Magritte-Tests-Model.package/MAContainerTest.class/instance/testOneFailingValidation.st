tests-validating
testOneFailingValidation
	| example |
	self description
		add: self child1;
		add: (self child2
			addCondition: [ :v | false ];
			beRequired;
			yourself).
	example := self exampleInstance.

	self
		should: [ example validate ]
		raise: MAValidationError.
	[ example validate ]
		on: MAValidationError
		do: [ :err |
			self assert: err class = MAMultipleErrors.
			self assert: err tag = self description.
			self assert: err collection size = 1.
			self assert: err collection first tag = self child2 ]