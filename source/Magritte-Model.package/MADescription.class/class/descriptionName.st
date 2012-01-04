accessing-description
descriptionName
	<magritte>
	^ MAStringDescription new
		accessor: #name;
		label: 'Kind';
		priority: 0;
		beReadonly;
		yourself