*magritte-seaside-accessing
descriptionComponentClass
	<magritteDescription>
	^ MASingleOptionDescription new
		accessor: #componentClass;
		label: 'Component Class';
		reference: MAClassDescription new;
		options: self defaultComponentClasses;
		default: self defaultComponentClass;
		priority: 1000;
		yourself