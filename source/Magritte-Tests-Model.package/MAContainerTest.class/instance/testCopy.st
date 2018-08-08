tests-copying
testCopy
	self description add: self child1; add: self child2.
	super testCopy.

	self deny: self description copy children == self description children.
	self assert: self description copy children first = self description children first.
	self assert: self description copy children second = self description children second