tests-copying
testCopyEmpty
	self description add: self child1; add: self child2.
	self assert: self description copyEmpty isEmpty