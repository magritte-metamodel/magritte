acessing-magritte
descriptionReference
	<magritteDescription>
	^ MAToOneRelationDescription new
		accessor: #reference;
		classes: [ MADescription withAllConcreteClasses ] magritteDynamicObject;
		label: 'Description';
		priority: 400;
		beRequired;
		yourself