tests-copying
testCopyAccessor
	self assert: self description copy accessor = self description accessor.
	self deny: self description copy accessor == self description accessor