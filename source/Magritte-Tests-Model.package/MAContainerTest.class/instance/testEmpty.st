tests-testing
testEmpty
	self assert: self description isEmpty.
	self description add: self child1.
	self deny: self description isEmpty