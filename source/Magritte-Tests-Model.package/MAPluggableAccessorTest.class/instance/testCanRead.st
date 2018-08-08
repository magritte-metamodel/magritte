tests-testing
testCanRead
	self assert: (self instance canRead: self).
	self instance readBlock: nil.
	self deny: (self instance canRead: self)