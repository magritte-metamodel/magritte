tests-enumerating
testDetect
	self description add: self child1.
	self assert: (self description
		detect: [ :each | self child1 = each ]) = self child1.
	self should: [ self description
		detect: [ :each | self child2 = each ] ] raise: Error