tests-properties
testDefinitive
	self description beDefinitive.
	self assert: self description isDefinitive.
	self assert: self description definitive.

	self description beModifiable.
	self deny: self description isDefinitive.
	self deny: self description definitive