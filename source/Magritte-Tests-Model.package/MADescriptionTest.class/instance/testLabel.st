tests-accessing
testLabel
	self description label: 'foo'.
	self assert: self description label = 'foo'