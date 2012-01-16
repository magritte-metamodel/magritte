acessing-magritte
descriptionOrdered
	<magritteDescription>
	^ MABooleanDescription new
		accessor: #ordered;
		label: 'Ordered';
		priority: 260;
		default: self defaultOrdered;
		yourself