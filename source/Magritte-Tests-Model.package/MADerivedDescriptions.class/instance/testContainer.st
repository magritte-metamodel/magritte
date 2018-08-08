tests
testContainer
	self assert: (baseModel magritteDescription hasProperty: #addressContainerBase).
	self assert: (derivedModel magritteDescription hasProperty: #addressContainerDerived)