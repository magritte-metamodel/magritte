tests
testWriteBlock
	self accessor writeBlock: [ :model :object |
		self assert: model = self.
		self assert: object = 123 ].
	self accessor write: 123 to: self