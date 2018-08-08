tests-copying
testCopyClasses
	self assert: self description copy classes = self description classes.
	self deny: self description copy classes == self description classes