tests-accessing
testAtAt
	self assert: (table at: 1 at: 1) = 1.
	self assert: (table at: 2 at: 3) = 8.
	self assert: (table at: 3 at: 2) = 9.
	self assert: (table at: 3 at: 4) = 81