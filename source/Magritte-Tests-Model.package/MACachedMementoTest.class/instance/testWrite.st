tests-basic
testWrite
	self write: self includedInstance.
	self assert: self read = self includedInstance.
	self assert: self value = self nullInstance.

	self write: self defaultInstance.
	self assert: self read = self defaultInstance.
	self assert: self value = self nullInstance