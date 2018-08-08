acessing-magritte
descriptionReference
	<magritteDescription>
	^ MAToOneRelationDescription new
		accessor: #reference;
		classes: MADescription withAllConcreteClasses;
		label: 'Description';
		priority: 400;
		beRequired;
		yourself