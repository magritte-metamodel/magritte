tests-removing
testRemove
	self description add: self child1; add: self child2.

	self description remove: self child1.
	self assert: self description size = 1.
	self deny: (self description includes: self child1).
	self assert: (self description includes: self child2).

	self description remove: self child2.
	self assert: self description isEmpty