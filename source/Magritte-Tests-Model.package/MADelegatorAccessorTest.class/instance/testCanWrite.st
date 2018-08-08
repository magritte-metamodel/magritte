tests-testing
testCanWrite
	self assert: (self accessor canWrite: self).

	self accessor next writeSelector: #zork:.
	self deny: (self accessor canWrite: self)