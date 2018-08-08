tests-identity
testAsAccessor
	self assert: self instance asAccessor = self instance.
	self assert: self instance asAccessor == self instance