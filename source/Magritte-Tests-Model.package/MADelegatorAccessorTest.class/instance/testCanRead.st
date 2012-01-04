tests-testing
testCanRead
	self assert: (self accessor canRead: self).

	self accessor next readSelector: #zork.
	self deny: (self accessor canRead: self)