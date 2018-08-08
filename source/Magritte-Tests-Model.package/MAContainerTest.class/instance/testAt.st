tests-enumerating
testAt
	self description add: self child1; add: self child2.
	self assert: (self description at: 1) = self child1.
	self assert: (self description at: 2) = self child2.
	self should: [ self description at: 3 ] raise: Error