strings
toString: anObject
	"Answer a string being formatted from ==anObject==."

	^ self toString: anObject writer: self stringWriter