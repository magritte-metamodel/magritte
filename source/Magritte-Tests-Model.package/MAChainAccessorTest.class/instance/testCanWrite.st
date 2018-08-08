tests-testing
testCanWrite
	self assert: (self accessor canWrite: self).
	self accessor accessor accessor writeSelector: #zork.
	self deny: (self accessor canWrite: self)