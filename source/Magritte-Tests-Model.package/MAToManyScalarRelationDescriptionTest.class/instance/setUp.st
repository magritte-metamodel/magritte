running
setUp
	super setUp.
	self description
		reference: (MAStringDescription new
			accessor: MANullAccessor new;
			yourself);
		classes: (Array with: String)