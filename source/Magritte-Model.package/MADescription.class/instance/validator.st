accessing-properties
validator
	"Answer a Visitor that can be used to validate the model described by the receiver."

	^ self propertyAt: #validator ifAbsent: [ self class defaultValidator ]