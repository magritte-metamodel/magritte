tests-testing
testCanRead
	self assert: (self accessor canRead: self).
	self accessor key: #zork.
	self assert: (self accessor canRead: self)