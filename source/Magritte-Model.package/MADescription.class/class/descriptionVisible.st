accessing-description
descriptionVisible
	<magritte>
	^ MABooleanDescription new
		accessor: #visible;
		label: 'Visible';
		priority: 210;
		default: self defaultVisible;
		yourself