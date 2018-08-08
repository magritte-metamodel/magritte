tests-identity
testAsAccessor
	super testAsAccessor.
	self assert: (nil asAccessor isKindOf: self actualClass)