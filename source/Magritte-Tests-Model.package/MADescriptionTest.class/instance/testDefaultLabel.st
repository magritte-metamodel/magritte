tests-accessing
testDefaultLabel
	self assert: self description label = ''.
	self description accessor: #foo.
	self assert: self description label = 'Foo'