strings
fromStringCollection: aCollection
	"Answer a collection of objects being parsed from ==aCollection== of strings."

	^ self fromStringCollection: aCollection reader: self stringReader