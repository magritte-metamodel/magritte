tests-enumerating
testAnySatisfy
	self description add: self child1; add: self child2.
	self assert: (self description anySatisfy: [ :each | each = self child2 ]).
	self deny: (self description anySatisfy: [ :each | each isNil ])