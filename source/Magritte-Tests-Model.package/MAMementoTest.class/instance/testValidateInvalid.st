tests-actions
testValidateInvalid
	self write: self invalidInstance.
	self should: [ self memento validate ] raise: MAValidationError