tests-accessing
testComment
	self description comment: 'bar'.
	self assert: self description comment = 'bar'