tests-accessing
testAccessor
	self description accessor: (MASelectorAccessor selector: #foo).
	self assert: self description accessor selector = #foo