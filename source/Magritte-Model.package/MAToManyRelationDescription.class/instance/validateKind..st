validating
validateKind: anObject

	self
		tryValidation: [ super validateKind: anObject ]
		ifPass: [ 
			anObject do: [ :object |
				(self classes anySatisfy: [ :class | object species includesBehavior: class ])
					ifFalse: [ MAKindError description: self signal: self kindErrorMessage ] ] ]