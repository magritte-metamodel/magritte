tests-validation
testValidateSpecific
	self
		shouldnt: [ self description validate: self includedInstance ]
		raise: MARequiredError