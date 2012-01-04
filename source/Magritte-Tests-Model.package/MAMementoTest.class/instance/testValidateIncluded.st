tests-actions
testValidateIncluded
	self write: self includedInstance.
	self shouldnt: [ self memento validate ] raise: MAValidationError