tests
testFilename
	self assert: model filename = 'unknown'.
	self assert: model extension isEmpty.

	model filename: 'test.txt'.
	self assert: model filename = 'test.txt'.
	self assert: model extension = 'txt'