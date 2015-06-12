validation-private
validateKind: anObject
	"Validate ==anObject== to be of the right kind."

	(anObject isKindOf: self kind)
		ifFalse: [ MAKindError description: self signal: self kindErrorMessage ]