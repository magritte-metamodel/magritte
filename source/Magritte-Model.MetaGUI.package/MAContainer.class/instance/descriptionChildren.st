acessing-magritte
descriptionChildren
	<magritteDescription>
	^ MAToManyRelationDescription new
		accessor: (MASelectorAccessor read: #children write: #setChildren:);
		classes: MAElementDescription withAllConcreteClasses;
		default: self class defaultCollection;
		label: 'Elements';
		priority: 400;
		beOrdered;
		yourself