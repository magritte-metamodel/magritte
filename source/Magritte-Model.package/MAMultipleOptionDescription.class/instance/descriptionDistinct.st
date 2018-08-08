acessing-magritte
descriptionDistinct
	<magritteDescription>
	^ MABooleanDescription new
		accessor: #distinct;
		label: 'Distinct';
		priority: 250;
		default: self class defaultDistinct;
		yourself