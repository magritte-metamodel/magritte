private
buildDescriptionTable
	^ self dataTable collect: 
		[ :row :col :each | 
		self description reference copy
			accessor: MANullAccessor new;
			label: row greaseString , '/' , col greaseString;
			propertyAt: #row
				put: row;
			propertyAt: #column
				put: col;
			yourself ]