tests-copying
testCopyReference
	self assert: self description copy reference = self description reference.
	self deny: self description copy reference == self description reference