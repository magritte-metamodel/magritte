tests-enumerating
testDetectIfNone
	self description add: self child1.
	self assert: (self description
		detect: [ :each | self child1 = each ]
		ifNone: [ 123 ]) = self child1.
	self assert: (self description
		detect: [ :each | self child2 = each ]
		ifNone: [ 123 ]) = 123