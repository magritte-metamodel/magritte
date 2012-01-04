tests
testRead
	self
		should: [ self accessor read: self ]
		raise: MAReadError