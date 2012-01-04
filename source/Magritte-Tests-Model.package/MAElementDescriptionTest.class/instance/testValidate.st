tests-validation
testValidate
	self description beRequired.
	self
		shouldnt: [ self description validate: self includedInstance ]
		raise: MAValidationError.
	self
		should: [ self description validate: self invalidInstance ]
		raise: MAKindError.
	self
		should: [ self description validate: self nullInstance ]
		raise: MARequiredError