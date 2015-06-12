accessing
properties
	"Answer the property dictionary of the receiver."

	^ properties ifNil: [ properties := Dictionary new ]