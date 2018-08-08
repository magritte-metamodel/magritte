tests-comparing
testEqual
	self assert: table = table.
	self assert: table = table copy.
	self assert: table copy = table.
	self assert: table copy = table copy.

	self deny: table = (table copy at: 1 at: 2 put: 3).
	self deny: table = (table copyRows: 3 columns: 3).
	self deny: table = (table copyRows: 4 columns: 4)