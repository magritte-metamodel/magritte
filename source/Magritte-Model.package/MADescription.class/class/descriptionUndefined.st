accessing-description
descriptionUndefined
	<magritte>
	^ MAStringDescription new
		accessor: #undefined;
		label: 'Undefined String';
		priority: 140;
		default: self defaultUndefined;
		yourself