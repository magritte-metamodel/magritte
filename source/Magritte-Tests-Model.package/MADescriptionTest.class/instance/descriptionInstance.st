private
descriptionInstance
	^ self actualClass new
		accessor: MANullAccessor new;
		yourself