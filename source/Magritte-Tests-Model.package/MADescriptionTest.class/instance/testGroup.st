tests-accessing
testGroup
	self assert: self description group isNil.
	self description group: 'foo'.
	self assert: self description group = 'foo'