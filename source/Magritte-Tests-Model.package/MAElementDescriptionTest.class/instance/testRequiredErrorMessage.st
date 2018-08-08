tests-validation
testRequiredErrorMessage
	self assert: self description requiredErrorMessage notEmpty.

	self description requiredErrorMessage: 'zork'.
	self assert: self description requiredErrorMessage = 'zork'.

	[ self description beRequired; validateRequired: self nullInstance ]
		on: MARequiredError
		do: [ :err | self assert: self description requiredErrorMessage = err messageText ]