strings
fromString: aString
	"Answer an object being parsed from ==aString==."

	^ self fromString: aString reader: self stringReader