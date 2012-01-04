accessing-description
descriptionDistinct
	<magritte>
	^ MABooleanDescription new
		accessor: #distinct;
		label: 'Distinct';
		priority: 250;
		default: self defaultDistinct;
		yourself