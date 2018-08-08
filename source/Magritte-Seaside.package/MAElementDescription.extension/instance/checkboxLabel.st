*magritte-seaside-accessing
checkboxLabel
	^ self propertyAt: #checkboxLabel ifAbsent: [ self label ]