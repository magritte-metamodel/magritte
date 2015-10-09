descriptions
descriptionLastName
	<magritteDescription>
	
	^ MAStringDescription new
		accessor: #lastName;
		label: 'Last Name';
		priority: 30;
		beRequired;
		yourself