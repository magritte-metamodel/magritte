tests-enumerating
testAllSatisfy
	self description add: self child1; add: self child2.
	self assert: (self description allSatisfy: [ :each | each = self child1 or: [ each = self child2 ] ]).
	self deny: (self description allSatisfy: [ :each | each = self child1 ])