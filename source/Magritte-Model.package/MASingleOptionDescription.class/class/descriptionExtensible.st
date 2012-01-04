accessing-descriptions
descriptionExtensible
	<magritte>
	^ MABooleanDescription new
		accessor: #extensible;
		label: 'Extensible';
		priority: 250;
		default: self defaultExtensible;
		yourself