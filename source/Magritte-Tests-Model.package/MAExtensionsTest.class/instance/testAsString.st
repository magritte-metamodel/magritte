tests-string
testAsString
	self assert: Object new greaseString = Object new printString.
	self assert: 'Hello World' greaseString = 'Hello World'.
	self assert: 123 greaseString = '123'