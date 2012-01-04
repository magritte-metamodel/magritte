tests
testAccessor
	self accessor accessor: self.
	self assert: self accessor accessor = self