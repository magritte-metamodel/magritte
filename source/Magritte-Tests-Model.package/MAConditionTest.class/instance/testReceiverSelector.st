tests
testReceiverSelector
	| condition |
	condition := MACondition receiver: 1 selector: #=.
	self assert: (condition value: 1).
	self deny: (condition value: 0)