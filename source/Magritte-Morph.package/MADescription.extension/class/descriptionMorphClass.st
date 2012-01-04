*magritte-morph-description
descriptionMorphClass
	<magritte>
	^ MASingleOptionDescription new
		accessor: #morphClass;
		label: 'Morph Class';
		priority: 2000;
		reference: MAClassDescription new;
		options: self defaultMorphClasses;
		default: self defaultMorphClass;
		yourself