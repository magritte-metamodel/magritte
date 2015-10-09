descriptions
descriptionHomeAddress
	<magritteDescription>
	
	^ MAToOneRelationDescription new
			componentClass: MAInternalEditorComponent;
			classes: (Array with: CMAddress);
			accessor: #homeAddress;
			label: 'Home Address';
			priority: 40;
			yourself