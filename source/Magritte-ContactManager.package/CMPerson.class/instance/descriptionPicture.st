descriptions
descriptionPicture
	<magritteDescription>
	
	^ MAFileDescription new
		addCondition: [ :value | value isImage ] labelled: 'Image expected';
		accessor: #picture;
		label: 'Picture';
		priority: 60;
		yourself