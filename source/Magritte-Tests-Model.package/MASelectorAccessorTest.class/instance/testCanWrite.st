tests-testing
testCanWrite
	self assert: (self accessor canWrite: self).

	self accessor writeSelector: #zork:.
	self deny: (self accessor canWrite: self).

	self accessor writeSelector: nil.
	self deny: (self accessor canWrite: self)