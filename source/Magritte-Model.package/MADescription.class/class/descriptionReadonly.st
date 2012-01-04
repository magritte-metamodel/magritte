accessing-description
descriptionReadonly
	<magritte>
	^ MABooleanDescription new
		accessor: #readonly;
		label: 'Readonly';
		priority: 200;
		default: self defaultReadonly;
		yourself