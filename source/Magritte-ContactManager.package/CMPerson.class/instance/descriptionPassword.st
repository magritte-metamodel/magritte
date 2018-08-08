descriptions
descriptionPassword
	<magritteDescription>
	
	^ MAPasswordDescription new
			componentClass: MAVerifiedPasswordComponent;
			accessor: #password;
			label: 'Password';
			priority: 100;
			yourself