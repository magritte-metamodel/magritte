descriptions
descriptionOfficeAddress
	<magritteDescription>
	
	^ MAToOneRelationDescription new
			componentClass: MAExternalEditorComponent;
			classes: (Array with: CMAddress);
			accessor: #officeAddress;
			label: 'Office Address';
			priority: 50;
			yourself