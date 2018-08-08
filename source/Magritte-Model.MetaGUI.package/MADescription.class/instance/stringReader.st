accessing-strings
stringReader
	"Answer a Visitor that can be used to parse the model described by the receiver from a string."

	^ self propertyAt: #stringReader ifAbsent: [ self class defaultStringReader ]