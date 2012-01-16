acessing-magritte
descriptionGroup
	<magritteDescription>
	^ MAStringDescription new
		accessor: #group;
		default: self class defaultGroup;
		label: 'Group';
		priority: 105;
		yourself