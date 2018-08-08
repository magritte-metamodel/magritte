tests-validation
testKindErrorMessage
	self assert: self description kindErrorMessage notEmpty.

	self description kindErrorMessage: 'zork'.
	self assert: self description kindErrorMessage = 'zork'.

	[ self description validateKind: self invalidInstance ]
		on: MAKindError
		do: [ :err | self assert: self description kindErrorMessage = err messageText ]