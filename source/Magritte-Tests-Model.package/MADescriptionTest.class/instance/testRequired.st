tests-actions
testRequired
	self description beRequired.
	self assert: self description required.
	self assert: self description isRequired.

	self description beOptional.
	self deny: self description required.
	self deny: self description isRequired