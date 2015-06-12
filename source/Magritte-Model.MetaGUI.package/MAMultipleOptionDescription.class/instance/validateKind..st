validating
validateKind: anObject
	super validateKind: anObject.
	(anObject allSatisfy: [ :each | self options includes: each ])
		ifFalse: [ MAKindError description: self signal: self kindErrorMessage ]