tests-basic
testWrite
	self write: self includedInstance.
	self assert: self value = self includedInstance.

	self write: self defaultInstance.
	self assert: self value = self defaultInstance.

	self write: self nullInstance.
	self assert: self value = self nullInstance