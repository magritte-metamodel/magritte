tests-copying
testCopyOptions
	self deny: self description copy options == self description options.
	self assert: self description copy options = self description options