acessing-magritte
descriptionRequired
	<magritteDescription>
	^ MABooleanDescription new
		accessor: #required;
		label: 'Required';
		priority: 220;
		default: self defaultRequired;
		yourself