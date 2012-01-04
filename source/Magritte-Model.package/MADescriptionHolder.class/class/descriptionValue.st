accessing
descriptionValue
	<magritte>
	^ MASingleOptionDescription new
		reference: MAClassDescription new;
		options: self descriptionClasses;
		selectorAccessor: 'contents';
		groupBy: #grouping;
		label: 'Type';
		priority: 20;
		yourself