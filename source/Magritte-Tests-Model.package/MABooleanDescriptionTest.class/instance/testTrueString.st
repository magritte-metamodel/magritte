tests
testTrueString
	self description trueString: 'ja'.
	self assert: (self description labelForOption: true) = 'ja'