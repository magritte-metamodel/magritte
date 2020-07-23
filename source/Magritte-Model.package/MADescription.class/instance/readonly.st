accessing-properties
readOnly
	"Test whether my model is read-only."

	^ self propertyAt: #readOnly ifAbsent: [ self class defaultReadOnly ]