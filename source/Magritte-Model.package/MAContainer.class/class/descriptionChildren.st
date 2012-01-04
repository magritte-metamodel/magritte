accessing-description
descriptionChildren
	<magritte>
	^ MAToManyRelationDescription new
		accessor: (MASelectorAccessor read: #children write: #setChildren:);
		classes: [ MAElementDescription withAllConcreteClasses ] magritteDynamicObject;
		default: self defaultCollection;
		label: 'Elements';
		priority: 400;
		beOrdered;
		yourself