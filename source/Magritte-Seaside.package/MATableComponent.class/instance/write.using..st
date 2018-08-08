private
write: anObject using: aDescription
	^ self dataTable
		at: (aDescription propertyAt: #row)
		at: (aDescription propertyAt: #column)
		put: anObject