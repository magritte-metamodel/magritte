tests-validation
testValidateSpecific
	super testValidateSpecific.
	self description
		min: self minInstance;
		max: self maxInstance.
	self
		shouldnt: [ self description validate: self includedInstance ]
		raise: MARangeError.
	self
		should: [ self description validate: self excludedInstance ]
		raise: MARangeError