accessing-strings
undefined
	"Answer a string that is printed whenever the model described by the receiver is ==nil==."

	^ (self propertyAt: #undefined ifAbsent: [ self class defaultUndefined ])
		ifNil: [ self class defaultUndefined ]