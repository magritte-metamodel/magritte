tests-copying
testCopy
	self assert: self instance = self instance copy.
	self deny: self instance == self instance copy