tests-testing
testCanRead
	self assert: (self accessor canRead: self).

	self accessor name: 'zork'.
	self deny: (self accessor canRead: self)