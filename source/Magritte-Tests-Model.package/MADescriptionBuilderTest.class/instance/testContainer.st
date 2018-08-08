tests
testContainer
	self assert: self magritteDescription label = 'mock'.
	self assert: (self magritteDescription hasProperty: #foo).
	self assert: (self magritteDescription hasProperty: #bar)