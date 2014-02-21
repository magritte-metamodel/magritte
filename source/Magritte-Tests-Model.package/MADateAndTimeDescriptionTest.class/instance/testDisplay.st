tests
testDisplay

	self testDisplay: [ :e | e asDate monthName ].
	self testDisplay: #monthName.