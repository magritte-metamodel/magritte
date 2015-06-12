acessing-magritte
descriptionValidator
	<magritteDescription>
	^ MASingleOptionDescription new
		accessor: #validator;
		label: 'Validator';
		priority: 250;
		default: self class defaultValidator;
		options: self class defaultValidator withAllSubclasses;
		reference: MAClassDescription new;
		yourself