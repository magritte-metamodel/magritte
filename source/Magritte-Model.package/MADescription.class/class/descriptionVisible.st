acessing-magritte
descriptionVisible
	<magritteDescription>
	^ MABooleanDescription new
		accessor: #visible;
		label: 'Visible';
		priority: 210;
		default: self defaultVisible;
		yourself