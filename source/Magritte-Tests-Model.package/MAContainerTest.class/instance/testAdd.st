tests-adding
testAdd
	self description add: self child1.
	self assert: (self description size = 1).
	self assert: (self description includes: self child1).

	self description add: self child2.
	self assert: (self description size = 2).
	self assert: (self description includes: self child1).
	self assert: (self description includes: self child2)