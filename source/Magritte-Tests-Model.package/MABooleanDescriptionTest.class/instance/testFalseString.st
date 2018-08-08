tests
testFalseString
	self description falseString: 'nein'.
	self assert: (self description labelForOption: false) = 'nein'