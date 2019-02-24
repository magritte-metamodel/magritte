accessing-magritte
descriptionAccessor
	<magritteDescription>
	^ MAToOneRelationDescription new
			reference: MAStringDescription new;
			accessor: #accessor;
			classes: MAAccessor allSubclasses;
			priority: 200;
			yourself