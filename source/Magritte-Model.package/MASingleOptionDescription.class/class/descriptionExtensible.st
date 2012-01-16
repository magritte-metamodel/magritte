acessing-magritte
descriptionExtensible
	<magritteDescription>
	^ MABooleanDescription new
		accessor: #extensible;
		label: 'Extensible';
		priority: 250;
		default: self defaultExtensible;
		yourself