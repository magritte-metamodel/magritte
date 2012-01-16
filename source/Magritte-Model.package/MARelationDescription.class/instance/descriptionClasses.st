acessing-magritte
descriptionClasses
	<magritteDescription>
	^ MAMultipleOptionDescription new
		accessor: #classes;
		label: 'Classes';
		priority: 400;
		options: [ Smalltalk allClasses ] magritteDynamicObject;
		reference: MAClassDescription new;
		yourself