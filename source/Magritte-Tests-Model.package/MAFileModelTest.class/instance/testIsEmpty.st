tests
testIsEmpty
	self assert: model isEmpty.

	model filename: 'foo.txt'.
	self assert: model isEmpty.

	model mimetype: 'text/plain'.
	self assert: model isEmpty.

	model contents: 'hello'.
	self deny: model isEmpty