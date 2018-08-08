descriptions
descriptionFirstName
	<magritteDescription>
	
	^ MAStringDescription new
			accessor: #firstName;
			label: 'First Name';
			priority: 20;
			beRequired;
			yourself