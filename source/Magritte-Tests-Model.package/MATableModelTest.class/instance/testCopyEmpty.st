tests-copying
testCopyEmpty
	self assert: table copyEmpty rowCount = table rowCount.
	self assert: table copyEmpty columnCount = table columnCount.
	self assert: (table copyEmpty contents allSatisfy: [ :each | each isNil ])