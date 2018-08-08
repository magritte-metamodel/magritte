strings
toString: anObject writer: aFormatter
	"Answer a string being formatted from ==anObject== using ==aFormatter==."

	^ aFormatter write: anObject description: self