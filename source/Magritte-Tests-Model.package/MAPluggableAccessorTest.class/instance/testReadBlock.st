tests
testReadBlock
	self accessor readBlock: [ :model |
		self assert: model = self. 123 ].
	self assert: (self accessor read: self) = 123