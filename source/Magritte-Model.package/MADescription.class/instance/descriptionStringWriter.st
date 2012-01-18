acessing-magritte
descriptionStringWriter
	<magritteDescription>
	^ MASingleOptionDescription new
		accessor: #stringWriter;
		label: 'String Writer';
		priority: 310;
		default: self class defaultStringWriter;
		options: self class defaultStringWriter withAllSubclasses;
		reference: MAClassDescription new;
		yourself