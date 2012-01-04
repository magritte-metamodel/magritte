accessing-description
descriptionStringWriter
	<magritte>
	^ MASingleOptionDescription new
		accessor: #stringWriter;
		label: 'String Writer';
		priority: 310;
		default: self defaultStringWriter;
		options: [ self defaultStringWriter withAllSubclasses ] magritteDynamicObject;
		reference: MAClassDescription new;
		yourself