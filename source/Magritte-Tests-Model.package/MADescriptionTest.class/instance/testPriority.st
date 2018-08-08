tests-accessing
testPriority
	self description priority: 123.
	self assert: self description priority = 123