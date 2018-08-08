tests
testDescription
	self assert: self magritteDescription size = 1.
	self assert: self magritteDescription children first label = 'foo'.
	self assert: (self magritteDescription children first hasProperty: #foo).
	self assert: (self magritteDescription children first hasProperty: #bar)