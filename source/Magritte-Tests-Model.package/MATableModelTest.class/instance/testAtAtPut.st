tests-accessing
testAtAtPut
	self assert: (table at: 1 at: 1 put: -1) = -1.
	self assert: (table at: 2 at: 3 put: -8) = -8.
	self assert: (table at: 3 at: 2 put: -9) = -9.
	self assert: (table at: 3 at: 4 put: -81) = -81.

	self assert: (table at: 1 at: 1) = -1.
	self assert: (table at: 2 at: 3) = -8.
	self assert: (table at: 3 at: 2) = -9.
	self assert: (table at: 3 at: 4) = -81