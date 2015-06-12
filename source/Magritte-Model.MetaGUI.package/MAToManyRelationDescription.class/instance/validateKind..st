validating
validateKind: anObject
	super validateKind: anObject.
	anObject do: [ :object |
		(self classes anySatisfy: [ :class | object species includesBehavior: class ])
			ifFalse: [ MAKindError description: self signal: self kindErrorMessage ] ]