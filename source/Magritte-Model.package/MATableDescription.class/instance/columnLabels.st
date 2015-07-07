accessing-properties
columnLabels
	^ self propertyAt: #columnLabels ifAbsent: [ self class defaultColumnLabels ]