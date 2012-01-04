tests
testContents
	self assert: model contents isEmpty.

	model contents: (ByteArray with: 1 with: 2 with: 3).
	self assert: model contents = (ByteArray with: 1 with: 2 with: 3).
	self assert: model filesize = 3