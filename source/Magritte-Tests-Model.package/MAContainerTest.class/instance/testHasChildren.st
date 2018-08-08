tests-testing
testHasChildren
	super testHasChildren.
	self description add: self child1.
	self assert: self description hasChildren