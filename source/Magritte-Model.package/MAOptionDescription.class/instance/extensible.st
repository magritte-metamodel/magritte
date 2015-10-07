accessing-properties
extensible
	^ self propertyAt: #extensible ifAbsent: [ self class defaultExtensible ]