private
validate: anObject using: aDescription
	aDescription validateRequired: anObject.
	anObject isNil ifTrue: [ ^ self ].
	aDescription
		tryValidation: [ aDescription validateKind: anObject ]
		ifPass: [ 
			aDescription
				validateSpecific: anObject;
				validateConditions: anObject ]
		