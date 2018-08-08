private
readUsing: aDescription
	^ self dataTable
		at: (aDescription propertyAt: #row)
		at: (aDescription propertyAt: #column)