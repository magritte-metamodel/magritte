descriptions
descriptionPhoneNumbers
	<magritteDescription>
	
	^ MAToManyRelationDescription new
		classes: (Array with: CMPhone);
		label: 'Phone Numbers';
		default: Array new;
		accessor: #phones;
		priority: 90;
		yourself