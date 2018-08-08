tests-enumerating
testNoneSatisfy
	self description add: self child1; add: self child2.
	self assert: (self description noneSatisfy: [ :each | each isNil ])