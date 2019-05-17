acessing-magritte
descriptionClasses
	<magritteDescription>
	^ MAMultipleOptionDescription new
		accessor: #classes;
		label: 'Classes';
		priority: 400;
		options: Smalltalk globals allClasses;
		reference: MAClassDescription new;
		yourself