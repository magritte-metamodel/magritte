tests-adding
testAddAll
	self description
		addAll: (Array with: self child1 with: self child2).

	self assert: (self description size = 2).
	self assert: (self description includes: self child1).
	self assert: (self description includes: self child2)