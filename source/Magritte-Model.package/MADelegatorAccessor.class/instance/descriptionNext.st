accessing-magritte
descriptionNext
	<magritteDescription>
	^ MAToOneRelationDescription new
			reference: MAStringDescription new;
			accessor: #next;
			classes: MAAccessor allSubclasses;
			priority: 100;
			yourself