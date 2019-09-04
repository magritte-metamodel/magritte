acessing-magritte
descriptionClasses
	<magritteDescription>
	^ MAMultipleOptionDescription new
		accessor: #classes;
		label: 'Classes';
		priority: 400;
		options: Smalltalk globals allClasses;
		default: Set new; "To avoid storing unneeded empty set [1]"
		reference: MAClassDescription new;
		yourself
		
"1. There may be a better way. When generating description methods from meta-meta descriptions, without the line above, an unneeded `default: Set new;` was being added to the generated method."