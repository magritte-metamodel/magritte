tests-accessing
testAtAtPutAbsent
	self should: [ table at: 0 at: 1 put: 0 ] raise: Error.
	self should: [ table at: 1 at: 0 put: 0 ] raise: Error.
	self should: [ table at: 4 at: 4 put: 0 ] raise: Error.
	self should: [ table at: 3 at: 5 put: 0 ] raise: Error