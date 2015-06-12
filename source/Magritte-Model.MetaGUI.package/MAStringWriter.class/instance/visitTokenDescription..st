visiting-description
visitTokenDescription: aDescription
	self object
		do: [ :each | self object: each during: [ self visit: aDescription reference ] ]
		separatedBy: [ self stream nextPut: aDescription separators first ]