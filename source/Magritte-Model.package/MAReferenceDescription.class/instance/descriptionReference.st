acessing-magritte
descriptionReference
	<magritteDescription>
	^ MAToOneRelationDescription new
		accessor: #reference;
		classes: MAElementDescription withAllConcreteClasses;
		label: 'Description';
		priority: 400;
		beRequired;
		yourself