tests-removing
testRemoveAll
	self description add: self child1; add: self child2.

	self description removeAll.
	self assert: self description isEmpty