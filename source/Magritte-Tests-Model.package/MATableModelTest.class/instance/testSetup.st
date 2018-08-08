tests
testSetup
	self assert: table rowCount = 3.
	self assert: table columnCount = 4.
	self assert: table contents = #( 1 1 1 1 2 4 8 16 3 9 27 81 )