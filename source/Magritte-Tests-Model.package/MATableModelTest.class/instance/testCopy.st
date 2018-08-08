tests-copying
testCopy
	self assert: table copy rowCount = table rowCount.
	self assert: table copy columnCount = table columnCount.
	self assert: table copy contents = table contents.
	self deny: table copy contents == table contents