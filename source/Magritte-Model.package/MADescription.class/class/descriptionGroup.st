accessing-description
descriptionGroup
	<magritte>
	^ MAStringDescription new
		accessor: #group;
		default: self defaultGroup;
		label: 'Group';
		priority: 105;
		yourself