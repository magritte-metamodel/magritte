tests-actions
testValidateRequired
	self descriptionValue beRequired.

	self write: self nullInstance.
	self should: [ self memento validate ] raise: MAValidationError