acessing-magritte
descriptionValue
	<magritteDescription>
	^ MASingleOptionDescription new
		reference: MAClassDescription new;
		options: self class descriptionClasses;
		selectorAccessor: 'contents';
		groupBy: #grouping;
		label: 'Type';
		priority: 20;
		yourself