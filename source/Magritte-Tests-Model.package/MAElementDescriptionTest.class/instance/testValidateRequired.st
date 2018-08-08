tests-validation
testValidateRequired
	self description beOptional.
	self
		shouldnt: [ self description validateRequired: self nullInstance ]
		raise: MARequiredError.
	self
		shouldnt: [ self description validateRequired: self includedInstance ]
		raise: MARequiredError.

	self description beRequired.
	self
		should: [ self description validateRequired: self nullInstance ]
		raise: MARequiredError.
	self
		shouldnt: [ self description validateRequired: self includedInstance ]
		raise: MARequiredError