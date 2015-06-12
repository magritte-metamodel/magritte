strings
fromStringCollection: aCollection reader: aParser
	"Answer a collection of objects being parsed from ==aCollection== of strings using ==aParser==."

	^ aCollection collect: [ :each | self fromString: each reader: aParser ]