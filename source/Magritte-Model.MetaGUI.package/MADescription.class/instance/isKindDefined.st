accessing
isKindDefined
	^ self propertyAt: #kind ifPresent: [ :theKind | true] ifAbsent: [ false ]