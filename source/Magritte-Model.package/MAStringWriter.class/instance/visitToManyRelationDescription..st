visiting-description
visitToManyRelationDescription: aDescription
	self object
		do: [ :each | self object: each during: [ self visit: each description ] ]
		separatedBy: [ self stream nextPutAll: ', ' ]