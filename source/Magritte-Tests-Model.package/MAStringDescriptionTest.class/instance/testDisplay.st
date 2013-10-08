tests
testDisplay

	self testDisplay: [ :e | e allButLast: 2 ].
	self testDisplay: #allButLast.