tests-properties
testGroupBy
	self deny: self description isGrouped.
	self description groupBy: #grouping.
	self assert: self description isGrouped.
