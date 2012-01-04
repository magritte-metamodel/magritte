tests-validation
testRangeErrorMessage
	self description
		min: self minInstance;
		max: self maxInstance.
	self assert: self description rangeErrorMessage notEmpty.

	self description rangeErrorMessage: 'zork'.
	self assert: self description rangeErrorMessage = 'zork'.

	[ self description validate: self excludedInstance ]
		on: MARangeError
		do: [ :err | self assert: self description rangeErrorMessage = err messageText ]