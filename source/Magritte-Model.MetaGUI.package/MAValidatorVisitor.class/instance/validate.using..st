private
validate: anObject using: aDescription
	aDescription validateRequired: anObject.
	anObject isNil ifTrue: [ ^ self ].
	aDescription
		validateKind: anObject;
		validateSpecific: anObject;
		validateConditions: anObject