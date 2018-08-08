tests-testing
testHasLabel
	self description label: nil.
	self deny: self description hasLabel.

	self description label: ''.
	self deny: self description hasLabel.

	self description label: 'label'.
	self assert:  self description hasLabel