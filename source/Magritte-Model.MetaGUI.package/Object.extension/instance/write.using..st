*magritte-model-model
write: anObject using: aDescription
	"Dispatch the write-access to the receiver of anObject using the accessor of aDescription."

	aDescription accessor write: anObject to: self