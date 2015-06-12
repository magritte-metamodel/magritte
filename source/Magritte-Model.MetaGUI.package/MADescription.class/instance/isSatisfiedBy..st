validation
isSatisfiedBy: anObject
	"Answer ==true== if ==anObject== is a valid instance of the receiver's description."

	[ self validate: anObject ]
		on: MAValidationError
		do: [ :err | ^ false ].
	^ true