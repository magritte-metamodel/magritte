tests-testing
testIncludes
	self deny: (self description includes: self child1).
	self description add: self child1.
	self assert: (self description includes: self child1)