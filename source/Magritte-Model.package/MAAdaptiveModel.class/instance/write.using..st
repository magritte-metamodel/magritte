model
write: anObject using: aDescription
	"Set ==anObject== to be that actual value of the receiver for ==aDescription==."

	self values at: aDescription put: anObject