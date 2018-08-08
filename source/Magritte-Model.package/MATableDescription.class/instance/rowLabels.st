accessing-properties
rowLabels
	^ self propertyAt: #rowLabels ifAbsent: [ self class defaultRowLabels ]