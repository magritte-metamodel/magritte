tests-actions
testValidateConflictCommit
	self write: self includedInstance.
	self shouldnt: [ self memento validate ] raise: MAValidationError.

	self value: self otherInstance.
	self should: [ self memento validate ] raise: MAValidationError.

	self memento commit.
	self shouldnt: [ self memento validate ] raise: MAValidationError