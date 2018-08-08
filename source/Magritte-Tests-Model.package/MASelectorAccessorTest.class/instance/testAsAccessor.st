tests-identity
testAsAccessor
	super testAsAccessor.
	self assert: #value asAccessor = self instance.
	self deny: #value asAccessor == self instance