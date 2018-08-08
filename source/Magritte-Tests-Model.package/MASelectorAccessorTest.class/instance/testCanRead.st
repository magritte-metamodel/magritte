tests-testing
testCanRead
	self assert: (self accessor canRead: self).

	self accessor readSelector: #zork.
	self deny: (self accessor canRead: self).

	self accessor readSelector: nil.
	self deny: (self accessor canRead: self)