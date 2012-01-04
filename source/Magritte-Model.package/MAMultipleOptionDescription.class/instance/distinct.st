accessing-properties
distinct
	^ self propertyAt: #distinct ifAbsent: [ self class defaultDistinct ]