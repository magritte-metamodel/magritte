tests-properties
testSorted
	self description beDistinct.
	self assert: self description isDistinct.
	self assert: self description distinct.

	self description beIndefinite.
	self deny: self description isDistinct.
	self deny: self description distinct