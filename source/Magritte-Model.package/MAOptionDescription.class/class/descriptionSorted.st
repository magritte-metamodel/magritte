acessing-magritte
descriptionSorted
	<magritteDescription>
	^ MABooleanDescription new
		accessor: #sorted;
		label: 'Sorted';
		priority: 240;
		default: self defaultSorted;
		yourself