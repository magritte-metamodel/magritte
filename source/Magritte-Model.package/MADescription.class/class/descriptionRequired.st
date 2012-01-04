accessing-description
descriptionRequired
	<magritte>
	^ MABooleanDescription new
		accessor: #required;
		label: 'Required';
		priority: 220;
		default: self defaultRequired;
		yourself