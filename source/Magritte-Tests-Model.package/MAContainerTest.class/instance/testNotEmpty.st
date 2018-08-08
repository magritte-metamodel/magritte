tests-testing
testNotEmpty
	self deny: self description notEmpty.
	self description add: self child1.
	self assert: self description notEmpty