acessing-magritte
descriptionUndefined
	<magritteDescription>
	^ MAStringDescription new
		accessor: #undefined;
		label: 'Undefined String';
		priority: 140;
		default: self defaultUndefined;
		yourself