accessing-description
descriptionOrdered
	<magritte>
	^ MABooleanDescription new
		accessor: #ordered;
		label: 'Ordered';
		priority: 260;
		default: self defaultOrdered;
		yourself