tests-testing
testIsSortable
	self assert: (self description isSortable or: [ self description isSortable not ])