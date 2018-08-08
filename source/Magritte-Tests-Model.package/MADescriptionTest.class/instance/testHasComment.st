tests-testing
testHasComment
	self description comment: nil.
	self deny: self description hasComment.

	self description comment: ''.
	self deny: self description hasComment.

	self description comment: 'comment'.
	self assert:  self description hasComment