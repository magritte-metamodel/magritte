tests-converting
testAsContainer
	self assert: (self description asContainer size) = 1.
	self assert: (self description asContainer includes: self description)