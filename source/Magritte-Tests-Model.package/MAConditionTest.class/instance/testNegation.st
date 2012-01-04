tests
testNegation
	| condition |
	condition := (MACondition selector: #isInteger) not.
	self assert: (condition value: 0.6).
	self deny: (condition value: 1)