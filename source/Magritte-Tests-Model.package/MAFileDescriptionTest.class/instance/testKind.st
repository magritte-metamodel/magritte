tests-accessing
testKind
	super testKind.
	self description kind: MAFileModelStub.
	self assert: self description kind = MAFileModelStub