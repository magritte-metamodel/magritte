tests-accessing
testUndefined
	self description undefined: 'nop'.
	self assert: self description undefined = 'nop'