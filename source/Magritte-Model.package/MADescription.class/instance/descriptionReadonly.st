acessing-magritte
descriptionReadOnly
	<magritteDescription>
	^ MABooleanDescription new
		accessor: #readOnly;
		label: 'Read-only';
		priority: 200;
		default: self class defaultReadOnly;
		yourself