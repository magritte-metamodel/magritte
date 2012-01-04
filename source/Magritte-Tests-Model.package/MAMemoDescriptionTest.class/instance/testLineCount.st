tests-properties
testLineCount
	self description lineCount: 123.
	self assert: self description lineCount = 123