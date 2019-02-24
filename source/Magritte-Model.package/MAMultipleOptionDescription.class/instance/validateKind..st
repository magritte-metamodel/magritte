validating
validateKind: anObject
	self 
		tryValidation: [ super validateKind: anObject ]
	  ifPass: [ anObject do: [ :e | self validateOptionKind: e ] ]