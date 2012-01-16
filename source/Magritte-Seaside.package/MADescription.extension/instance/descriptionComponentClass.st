*magritte-seaside-accessing
descriptionComponentClass
	<magritteDescription>
	^ MASingleOptionDescription new
		accessor: #componentClass;
		label: 'Component Class';
		reference: MAClassDescription new;
		options: self class defaultComponentClasses;
		default: self class defaultComponentClass;
		priority: 1000;
		yourself