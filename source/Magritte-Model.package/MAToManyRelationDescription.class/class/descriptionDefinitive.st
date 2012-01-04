accessing-description
descriptionDefinitive
	<magritte>
	^ MABooleanDescription new
		accessor: #definitive;
		label: 'Definitive';
		priority: 265;
		default: self defaultDefinitive;
		yourself