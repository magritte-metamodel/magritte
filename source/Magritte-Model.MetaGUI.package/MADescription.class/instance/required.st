accessing-properties
required
	"Answer ==true== if the model described by the receiver is required, this is it cannot be ==nil==."

	^ self propertyAt: #required ifAbsent: [ self class defaultRequired ]