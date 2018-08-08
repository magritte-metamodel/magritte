validating
validateOptionKind: anObject
	(self options includes: anObject)
		ifTrue: [ ^ self ].
	self isExtensible
		ifTrue: [ self reference validate: anObject ]
		ifFalse: [ MAKindError description: self signal: self kindErrorMessage ]