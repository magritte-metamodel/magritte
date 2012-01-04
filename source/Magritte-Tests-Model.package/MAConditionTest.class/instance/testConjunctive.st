tests
testConjunctive
	| condition |
	condition := (MACondition selector: #isInteger) & (MACondition selector: #positive).
	self assert: (condition value: 1).
	self deny: (condition value: 1.5).	
	self deny: (condition value: -1).
	self deny: (condition value: -1.5)