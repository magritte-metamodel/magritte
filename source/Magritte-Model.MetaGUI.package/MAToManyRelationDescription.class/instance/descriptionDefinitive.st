acessing-magritte
descriptionDefinitive
	<magritteDescription>
	^ MABooleanDescription new
		accessor: #definitive;
		label: 'Definitive';
		priority: 265;
		default: self class defaultDefinitive;
		yourself