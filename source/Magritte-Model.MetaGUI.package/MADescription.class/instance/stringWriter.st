accessing-strings
stringWriter
	"Answer a Visitor that can be used to convert the model described by the receiver to a string."

	^ self propertyAt: #stringWriter ifAbsent: [ self class defaultStringWriter ]