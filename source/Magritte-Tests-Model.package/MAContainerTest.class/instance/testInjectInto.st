tests-enumerating
testInjectInto
	self description add: self child1; add: self child2.
	self assert: (self description
		inject: 'start'
		into: [ :result :each | result , ' ' , each label ]) = 'start child1 child2'