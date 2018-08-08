tests-testing
testCanWrite
	self assert: (self accessor canWrite: self).

	self accessor name: 'zork'.
	self deny: (self accessor canWrite: self)