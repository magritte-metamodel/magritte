tests
testWrite
	self scaffolder write: 'bar' using: self descriptions first.
	self scaffolder write: 321 using: self descriptions second.

	self assert: (self scaffolder readUsing: self descriptions first) = 'bar'.
	self assert: (self scaffolder readUsing: self descriptions second) = 321