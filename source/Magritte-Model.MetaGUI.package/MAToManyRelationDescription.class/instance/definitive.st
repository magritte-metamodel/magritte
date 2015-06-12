accessing-properties
definitive
	"Return true if the field is non-modifiable"

	^ self propertyAt: #definitive ifAbsent: [ self class defaultDefinitive ]