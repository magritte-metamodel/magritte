accessing-description
descriptionValidator
	<magritte>
	^ MASingleOptionDescription new
		accessor: #validator;
		label: 'Validator';
		priority: 250;
		default: self defaultValidator;
		options: [ self defaultValidator withAllSubclasses ] magritteDynamicObject;
		reference: MAClassDescription new;
		yourself