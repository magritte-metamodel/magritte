*magritte-morph-accessing
descriptionMorphClass
	<magritteDescription>
	^ MASingleOptionDescription new
		accessor: #morphClass;
		label: 'Morph Class';
		priority: 2000;
		reference: MAClassDescription new;
		options: self class defaultMorphClasses;
		default: self class defaultMorphClass;
		yourself