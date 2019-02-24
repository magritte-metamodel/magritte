acessing-magritte
descriptionAccessor
	<magritteDescription>
	^ MAToOneRelationDescription new
		reference: MAStringDescription new;
		accessor: #accessor;
		classes: MAAccessor allSubclasses;
		priority: 10;
		yourself