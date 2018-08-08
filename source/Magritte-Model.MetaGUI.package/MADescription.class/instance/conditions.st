accessing-properties
conditions
	"Answer a collection of additional conditions that need to be fulfilled so that the described model is valid. Internally the collection associates conditions with an error string."

	^ self propertyAt: #conditions ifAbsent: [ self class defaultConditions ]