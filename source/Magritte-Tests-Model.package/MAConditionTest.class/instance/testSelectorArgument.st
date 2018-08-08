tests
testSelectorArgument
	| condition |
	condition := MACondition selector: #< argument: 5.
	self assert: (condition value: 1).
	self deny: (condition value: 5)