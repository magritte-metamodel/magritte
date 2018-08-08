tests-enumerating
testAtIfAbsent
	self description add: self child1; add: self child2.
	self assert: (self description at: 1 ifAbsent: [ 'not' ]) = self child1.
	self assert: (self description at: 2 ifAbsent: [ 'not' ]) = self child2.
	self assert: (self description at: 3 ifAbsent: [ 'not' ]) = 'not'