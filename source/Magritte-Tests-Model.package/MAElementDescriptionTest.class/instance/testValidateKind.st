tests-validation
testValidateKind
	self
		should: [ self description validateKind: self invalidInstance ]
		raise: MAKindError.
	self
		shouldnt: [ self description validateKind: self includedInstance ]
		raise: MAKindError