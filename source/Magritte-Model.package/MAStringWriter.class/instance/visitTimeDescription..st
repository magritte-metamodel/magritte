visiting-description
visitTimeDescription: aDescription 
	| time |
	time := self object.
	self stream
		nextPutAll: time hour greaseString;
		nextPut: $:;
		nextPutAll: time minute greaseString;
		nextPut: $:;
		nextPutAll: time second greaseString