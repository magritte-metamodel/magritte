validating
validateKind: anObject
	super validateKind: anObject.
	(self classes anySatisfy: [ :class | anObject species includesBehavior: class ])
		ifFalse: [ MAKindError description: self signal: self kindErrorMessage ]