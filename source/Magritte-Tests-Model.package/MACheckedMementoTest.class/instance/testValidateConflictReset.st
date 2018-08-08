tests-actions
testValidateConflictReset
	self write: self includedInstance.
	self shouldnt: [ self memento validate ] raise: MAValidationError.

	self value: self otherInstance.
	self should: [ self memento validate ] raise: MAValidationError.

	self memento reset.
	self shouldnt: [ self memento validate ] raise: MAValidationError