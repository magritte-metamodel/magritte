strings
fromString: aString reader: aParser
	"Answer an object being parsed from ==aString== using ==aParser==."

	^ aParser read: aString readStream description: self