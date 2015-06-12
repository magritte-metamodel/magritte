acessing-magritte
descriptionVisible
	<magritteDescription>
	^ MABooleanDescription new
		accessor: #visible;
		label: 'Visible';
		priority: 210;
		default: self class defaultVisible;
		yourself