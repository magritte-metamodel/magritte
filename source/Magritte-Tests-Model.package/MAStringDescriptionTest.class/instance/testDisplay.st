tests
testDisplay

	self testDisplay: [ :e | e asString allButLast: 2 ].
	self testDisplay: #asString. "Since #asString is the default behavior, this is only showing an example of the API, not actually testing anything. In real use, you might send e.g. #allButLast"