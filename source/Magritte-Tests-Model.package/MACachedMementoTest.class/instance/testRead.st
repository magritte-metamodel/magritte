tests-basic
testRead
	self assert: self read = self defaultInstance.

	self value: self includedInstance.
	self assert: self read = self defaultInstance